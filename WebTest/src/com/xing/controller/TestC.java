package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;

@MyController
@RequestMapping(value = "/test")
public class TestC {

    @RequestMapping(value = "/param")
    public String passTest(byte b,short s,int i,long l,char c,boolean bool,float f,double d){
        System.out.println("byte:"+b);
        System.out.println("short:"+s);
        System.out.println("long:"+l);
        System.out.println("int:"+i);

        return ""+c+bool+f+d;
    }
}
