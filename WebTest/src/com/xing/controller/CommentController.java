package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;

@MyController
@RequestMapping(value = "/Comment")
public class CommentController {

    @RequestMapping(value = "/show.do")
    public void show(){
        System.out.println("do show method");
    }

    @RequestMapping(value = "/history.do")
    public void history(){
        System.out.println("do history method");
    }
    @RequestMapping(value = "/my.do")
    public void myMea(String str,int myi){
        System.out.println("str:"+str+",int:"+myi);
    }
}
