package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;
import com.xing.core.Viewer;

@MyController
@RequestMapping(value = "/shop")
public class ShopCarController {
    Viewer viewer = new Viewer("/shoppingcar.jsp");

    @RequestMapping(value = "/shopcar.do")
    public Viewer shoppingCar(int uid) {


        return viewer;
    }
}
