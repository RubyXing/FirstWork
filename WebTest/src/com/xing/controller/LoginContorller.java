package com.xing.controller;

import com.xing.pojo.Users;
import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;
import com.xing.core.Viewer;
import com.xing.dao.UserDao;

import javax.servlet.http.HttpServletRequest;

@MyController
@RequestMapping(value = "/account")
public class LoginContorller {
    Viewer viewer = new Viewer("/courseList/list.do");
    UserDao userDao = new UserDao();

    @RequestMapping(value = "/login.do")
    public Viewer login(HttpServletRequest req) {
        String usermes = req.getParameter("usermessage");
        String userpwd = req.getParameter("userpwd");
        System.out.println("mes:" + usermes + ",usepwd:" + userpwd);
        Users users = userDao.userLogin(usermes);
        //判断不够细致
        if (!"null".equals(req.getParameter("courseId")) && !req.getParameter("courseId").equals("")) {
            int courseId = Integer.parseInt(req.getParameter("courseId"));
            viewer.setUrl("response:/detail/course.do?courseId=" + courseId);
        }
        if (users != null) {
            if (userpwd.equals(users.getUpwd())) {
                req.getSession().setAttribute("user", users.getUname());
                req.getSession().setAttribute("vip", users.getUvip());
                req.getSession().setAttribute("userid", users.getUid());
            }
        }
        return viewer;
    }
}
