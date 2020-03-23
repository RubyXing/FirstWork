package com.xing.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        System.out.println("=========================================");
        System.out.println("拦截到的请求为" + req.getRequestURI());


        if (req.getSession().getAttribute("user") == null || req.getSession().getAttribute("user") == "") {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        } else {
            // session中的内容等于登录页面, 则可以继续访问其他区资源.
            filterChain.doFilter(req, res);
        }
    }

    @Override
    public void destroy() {

    }
}
