package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;
import com.xing.core.Viewer;
import com.xing.dao.CouresDao;
import com.xing.dao.DetailDao;
import com.xing.pojo.Cdetails;
import com.xing.pojo.Courselist;

@MyController
@RequestMapping(value = "/detail")
public class DetailController {
    Viewer viewer = new Viewer("/courseDetail.jsp");
    CouresDao couresDao = new CouresDao();
    DetailDao detailDao = new DetailDao();

    @RequestMapping(value = "/course.do")
    public Viewer getCourseById(int courseId) {
        Courselist course = couresDao.getDetailCourse(courseId);
        Cdetails detailCourse = detailDao.getDetailCourse(courseId);

        viewer.getHashMap().put("course", course);
        viewer.getHashMap().put("courseDetail", detailCourse);

        return viewer;
    }
}
