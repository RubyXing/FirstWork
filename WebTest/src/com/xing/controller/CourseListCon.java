package com.xing.controller;

import com.xing.annonation.MyController;
import com.xing.annonation.RequestMapping;
import com.xing.core.Viewer;
import com.xing.dao.CouresDao;
import com.xing.dao.TagDao;
import com.xing.pojo.Courselist;
import com.xing.pojo.Ctag;

import java.util.ArrayList;
import java.util.List;

@MyController
@RequestMapping(value = "/courseList")
public class CourseListCon {
    TagDao tagDao = new TagDao();
    CouresDao couresDao = new CouresDao();
    //课程方向
    ArrayList<Ctag> direction = new ArrayList<>();
    //课程标签
    ArrayList<Ctag> type = new ArrayList<>();
    //课程类型
    ArrayList<Ctag> label = new ArrayList<>();
    //课程条件
    ArrayList<Ctag> condition = new ArrayList<>();
    //全部课程列表
    List<Courselist> courseList = new ArrayList<>();
    //方向课程
    List<Courselist> typeCourse = new ArrayList<>();
    //标签课程
    List<Courselist> labelCourse = new ArrayList<>();
    Viewer viewer = new Viewer("/courseList.jsp");


    //全部列表
    @RequestMapping(value = "/list.do")
    public Viewer list() {
        //处理标签
        if (direction.isEmpty()) {
            List<Ctag> showList = tagDao.getShowList();
            classifyTop(showList);
        }
        viewer.getHashMap().put("direction", direction);
        viewer.getHashMap().put("type", type);
        viewer.getHashMap().put("label", label);
        viewer.getHashMap().put("condition", condition);

        if (courseList.isEmpty()) {
            courseList = couresDao.getCourse();
        }

        viewer.getHashMap().put("courseList", courseList);
        return viewer;
    }

    //选定方向
    @RequestMapping(value = "/getTop.do")
    public Viewer getByTop(int topid) {
        ArrayList<Ctag> nType = new ArrayList<>();

        type.forEach(item -> {
            if (topid == item.getTopid()) {
                nType.add(item);
            }
        });
        typeCourse.clear();
        courseList.forEach(item -> {
            if (topid == item.getCdirection()) {
                typeCourse.add(item);
            }
        });

        viewer.getHashMap().put("type", nType);
        viewer.getHashMap().put("courseList", typeCourse);
        return viewer;
    }

    //选定标签
    @RequestMapping(value = "/getType.do")
    public Viewer getByType(int typeId) {
        labelCourse.clear();
        courseList.forEach(item -> {
            if (typeId == item.getCtype()) {
                labelCourse.add(item);
            }
        });

        viewer.getHashMap().put("courseList", labelCourse);
        return viewer;
    }

    //筛选类型条件
    @RequestMapping(value = "/checkLabel.do")
    public Viewer checkLabel(int labelId) {
        ArrayList<Courselist> nCourse = new ArrayList<>();
        //从底要求以此往上找课程表
        List<Courselist> tempList = new ArrayList<>(labelCourse);
        if (labelCourse.isEmpty()) {
            tempList = new ArrayList<>(typeCourse);
        }
        if (typeCourse.isEmpty()) {
            tempList = new ArrayList<>(courseList);
        }
        System.out.println("tempList:" + tempList);
        if (labelId < 400) {
            tempList.forEach(item -> {
                if (labelId == item.getClabe()) {
                    nCourse.add(item);
                }
            });
        } else {
            tempList.forEach(item -> {
                if (labelId == item.getCcondition()) {
                    nCourse.add(item);
                }
            });
        }

        viewer.getHashMap().put("courseList", nCourse);
        return viewer;
    }

    //把查询出来的标签数据分组
    private void classifyTop(List<Ctag> list) {
        list.forEach(item -> {
            if (item.getTid() < 200) {
                direction.add(item);
            } else if (item.getTid() < 300) {
                type.add(item);
            } else if (item.getTid() < 400) {
                label.add(item);
            } else {
                condition.add(item);
            }
        });
    }
}
