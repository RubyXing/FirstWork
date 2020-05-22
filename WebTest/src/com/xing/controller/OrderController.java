package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;
import com.xing.core.Viewer;
import com.xing.dao.OrderDao;
import com.xing.dao.ShopCarDao;
import com.xing.pojo.Courselist;
import com.xing.pojo.Ldetail;
import com.xing.pojo.Orderlist;

import java.util.HashMap;
import java.util.List;

@MyController
@RequestMapping(value = "/order")
public class OrderController {
    Viewer viewer = new Viewer("/ordershow.jsp");
    ShopCarDao shopCarDao = new ShopCarDao();
    OrderDao orderDao = new OrderDao();

    @RequestMapping(value = "/list.do")
    public Viewer orderList(int userId) {
        HashMap<String, Object> tempHs = orderDao.getOrder(userId);
        List<Orderlist> orderlist = (List<Orderlist>) tempHs.get("orderlist");
        List<Ldetail> orderdetail = (List<Ldetail>) tempHs.get("orderdetail");
        viewer.getHashMap().put("orderlist", orderlist);
        viewer.getHashMap().put("orderdetail", orderdetail);

        return viewer;
    }

    @RequestMapping(value = "/addorder.do")
    public Viewer addOrder(int userId) {
        HashMap<String, Object> listShop = shopCarDao.listShop(userId);
        List<Courselist> course = (List<Courselist>) listShop.get("course");
        orderDao.cToOrder(userId, course);
        shopCarDao.deleteAll(userId);
        return orderList(userId);
    }
}
