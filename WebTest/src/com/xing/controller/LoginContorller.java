package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;
import com.xing.core.Viewer;

@MyController
@RequestMapping(value = "/account")
public class LoginContorller {
    Viewer viewer = new Viewer("/login.jsp");

    @RequestMapping(value = "/login.do")
    public Viewer login() {

        return viewer;
    }
}
