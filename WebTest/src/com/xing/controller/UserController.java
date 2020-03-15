package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;

@MyController
@RequestMapping(value = "/User")
public class UserController {

    @RequestMapping(value = "/login.do")
    public void login(){
        System.out.println("User login");
    }

    @RequestMapping(value = "/logout.do")
    public void logout(){
        System.out.println("User logout");
    }
}
