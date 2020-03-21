package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;
import com.xing.core.Viewer;
import com.xing.dao.DetailDao;
import com.xing.pojo.Cdetails;

@MyController
@RequestMapping(value = "/detail")
public class DetailController {
    Viewer viewer = new Viewer("/courseDetail.jsp");
    DetailDao detailDao = new DetailDao();

    @RequestMapping(value = "/course")
    public Viewer getCourseById(int courseId) {
        Cdetails detailCourse = detailDao.getDetailCourse(courseId);

        viewer.getHashMap().put("courseDetail", detailCourse);
        return viewer;
    }
}
