package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;
import com.xing.core.Viewer;
import com.xing.dao.ShopCarDao;
import com.xing.pojo.Courselist;
import com.xing.pojo.Shopcar;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;


@MyController
@RequestMapping(value = "/shop")
public class ShopCarController {
    Viewer viewer = new Viewer("");
    int userid = 0;
    ShopCarDao shopCarDao = new ShopCarDao();

    @RequestMapping(value = "/carlist.do")
    public Viewer shoppingCar(HttpServletRequest req) {
        viewer.setUrl("/shoppingcar.jsp");
        //获取session中的用户id
        userid = Integer.parseInt(req.getSession().getAttribute("userid").toString());
        HashMap<String, Object> listCar = shopCarDao.listShop(userid);
        List<Courselist> course = (List<Courselist>) listCar.get("course");
        viewer.getHashMap().put("course", course);
        return viewer;
    }

    @RequestMapping(value = "/addCourse.do")
    public Viewer addCourse(int courseId, int userid) {
        viewer.setUrl("response:/detail/course.do?courseId=" + courseId);
        shopCarDao.addProduct(courseId, userid);
        HashMap<String, Object> listCar = shopCarDao.listShop(userid);
        List<Courselist> course = (List<Courselist>) listCar.get("course");
        viewer.getHashMap().put("course", course);
        return viewer;
    }

    @RequestMapping(value = "/delete.do")
    public Viewer deleteOne(int courseId) {
        viewer.setUrl("/shoppingcar.jsp");
        shopCarDao.deleteOne(userid, courseId);
        HashMap<String, Object> listCar = shopCarDao.listShop(userid);
        List<Courselist> course = (List<Courselist>) listCar.get("course");
        viewer.getHashMap().put("course", course);
        return viewer;
    }
}
