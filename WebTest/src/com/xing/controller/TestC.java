package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;
import com.xing.core.Viewer;
import com.xing.pojo.SimpleBean;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
    public Viewer getBean(SimpleBean bean) {
        System.out.println("getBean输出：");
        System.out.println(bean);

        Viewer viewer = new Viewer("request:/myshow.jsp");
        viewer.getHashMap().put("myBean", bean);
        ArrayList<String> list = new ArrayList<>();
        list.add("aaaaa");
        list.add("bbbbb");
        list.add("ccccc");
        list.add("ddddd");
        viewer.getHashMap().put("myList", list);
        return viewer;
    }
}
