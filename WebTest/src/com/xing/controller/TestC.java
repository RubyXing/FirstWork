package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;
import com.xing.pojo.SimpleBean;

import java.util.Arrays;

@MyController
@RequestMapping(value = "/test")
public class TestC {

    @RequestMapping(value = "/param.do")
    public String passTest(int i, int[] it, String str, String[] strs, double dou) {
        System.out.println(i);
        System.out.println(Arrays.toString(it));
        System.out.println(str);
        System.out.println(Arrays.toString(strs));
        System.out.println(dou);

        return "success";
    }

    @RequestMapping(value = "/getBean.do")
    public void getBean(SimpleBean bean) {
        System.out.println(bean);
    }
}
