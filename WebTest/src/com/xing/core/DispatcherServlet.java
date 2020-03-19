package com.xing.core;

import com.alibaba.fastjson.JSON;
import jdk.internal.org.objectweb.asm.tree.analysis.Value;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 MVC前端控制器
 */
public class DispatcherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Properties properties = new Properties();
    private List<String> clazzNames = new ArrayList<>();
    private HandlerMapping handlerMapping;
    private HandlerAdapter handlerAdapter;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("getScheme:"+req.getScheme());//获取请求协议
        System.out.println("getServerName:"+req.getServerName());//获取服务器名称
        System.out.println("getServerPort:" + req.getServerPort());//获取服务器端口号
        System.out.println("getContextPath:" + req.getContextPath());//获取项目的名称
        System.out.println("getQueryString:" + req.getQueryString());//获取参数部分
        System.out.println("getRequestURI:" + req.getRequestURI());//获取请求URI
        System.out.println("getRequestURL:" + req.getRequestURL());//获取请求URL
        System.out.println("getServletPath:" + req.getServletPath());//获取Servlet路径
        System.out.println("getPathInfo:" + req.getPathInfo());//获取请求servlet路径

        System.out.println("-----------------------------------------");

        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        Object adaptive = handlerAdapter.adaptive(req, resp);
        //若果是viewer类的返回值
        if (adaptive instanceof Viewer) {
            Viewer resultView = (Viewer) adaptive;
            String resultViewUrl = resultView.getUrl();
            if (resultViewUrl.startsWith("request:")) {
                //请求转发
                resultView.getHashMap().forEach(req::setAttribute);
                //输出查看设置的值
                System.out.println("request设置的值：");
                resultView.getHashMap().forEach((key, Value) -> {
                    System.out.println(key);
                    System.out.println(Value);
                });
                req.getRequestDispatcher(resultViewUrl.replace("request:", "")).forward(req, resp);
            } else {
                //重定向
                resp.sendRedirect(req.getContextPath() + resultViewUrl);
            }
        } else {
            out.print(JSON.toJSON(adaptive));
        }
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        //加载配置文件
        loadConfig(config.getInitParameter("contextConfigLocation"));
        scanPackage(properties.getProperty("controller"));
        //初始化IOC,方法容器
        handlerMapping=new HandlerMapping();
        handlerMapping.initIoc(clazzNames);
        //method放在IOC中初始化

        //初始化适配器
        handlerAdapter=new HandlerAdapter(handlerMapping);
    }

    private void loadConfig(String contextConfigLocation) {
        //1. 使用ClassLoader.getResourceAsStream加载资源是不能带有前导 / 字符的。
        //2. class.getResource("/") == class.getClassLoader().getResource("")。
        // Class.getResource和ClassLoader.getResource本质上是一样的,Class.getResource(String path)中path可以’/'开头，是因为在name = resolveName(name);进行了处理。
        //3. Class.getResource(String path)和Class.getClassLoader().getResource(String path)规则相同，
        // Class.getResourceAsStream(String path)和Class.getClassLoader().getResourceAsStream(String path)规则相同。
        try {
            properties.load(this.getClass().getClassLoader().getResourceAsStream(contextConfigLocation));
        }catch (Exception e){
            System.out.println("加载properties失败");
        }
    }

    private void scanPackage(String packageName){
        String formPackNmae = packageName.replace(".", "/");
        File file=new File(this.getClass().getClassLoader().getResource(formPackNmae).getFile());
        for (File listFile : file.listFiles()) {
            if (listFile.isDirectory()) {
                scanPackage(packageName+"."+listFile.getName());
            }
            clazzNames.add(packageName + "." + listFile.getName().replace(".class", ""));
        }
    }
}
