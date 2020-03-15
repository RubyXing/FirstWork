package com.xing.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.HashMap;
import java.util.Map;

public class HandlerAdapter {

    private HandlerMapping handlerMapping;
    private HashMap<String, Object> controllerMapping;
    private HashMap<String, Method> methodMapping;

    public HandlerAdapter(HandlerMapping handlerMapping) {
        this.handlerMapping = handlerMapping;
        controllerMapping = handlerMapping.getControllerMapping();
        methodMapping = handlerMapping.getMethodMapping();
    }

    public Object adaptive(HttpServletRequest req, HttpServletResponse resp){
        //获取请求servlet路径
        String servletPath = req.getServletPath();
        //获取对象
        Object controller = controllerMapping.get(servletPath);
        //获取方法
        Method method = methodMapping.get(servletPath);
        //获得方法形参数
        Parameter[] parameters = method.getParameters();
        //声明方法实参
        Object[] realParameter =new Object[parameters.length];
        //获取请求参数
        Map<String, String[]> parameterMap = req.getParameterMap();

        //找不到类或方法
        if (controller == null) {
            try {
                resp.sendError(333,"请求映射找不到controller或method");
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
            return null;
        }

        //判断方法是否需要传参request，response。
        for (int i = 0; i < parameters.length; i++) {
            //获取参数类型
            Class<?> parmetType = parameters[i].getType();
            //判断填入参数
            if (parmetType.isAssignableFrom(HttpServletRequest.class)) {
                realParameter[i] = req;
            }else if (parmetType.isAssignableFrom(HttpServletResponse.class)){
                realParameter[i] = resp;
            }
            //判断是否为基本数据类型
            else if (parmetType.isPrimitive()){
                //获取参数名称
                String parameterName = parameters[i].getName();
                //通过参数名获取请求参数
                String[] parameterString = parameterMap.get(parameterName);
                //将string转为对应数据类型放入实参
                realParameter[i] = conversionType(parameterString,parmetType);

            }

        }


        //获取方法返回值
        Object obj=null;
        try {
            obj=method.invoke(controller,realParameter);
        } catch (Exception e) {
            System.out.println("HandlerAdapter，方法执行错误");
            System.out.println(e);
        }
        return obj;
    }

    private Object conversionType(String[] parameterString, Class<?> parmetType) {
        Object obj=null;

        return obj;
    }


}
