package com.xing.dao;

import com.xing.jdbcUtil.JdbcConnect;
import com.xing.pojo.Courselist;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class CouresDao {
    private QueryRunner qr = new QueryRunner();
    private JdbcConnect connect = new JdbcConnect();

    //获得所有课程list集合
    public List<Courselist> getCourse() {
        List<Courselist> list = null;
        try {
            list = qr.query(connect.getCon(), "select * from courselist", new BeanListHandler<Courselist>(Courselist.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //获得具体课程
    public Courselist getDetailCourse(int courseId) {
        Courselist courselist = null;
        String sql = "select * from courselist where cid=" + courseId;
        try {
            courselist = qr.query(connect.getCon(), sql, new BeanHandler<>(Courselist.class));
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("获取具体课程失败");
        }

        return courselist;
    }

}
