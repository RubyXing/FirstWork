package com.xing.dao;

import com.xing.jdbcUtil.JdbcConnect;
import com.xing.pojo.Cdetails;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class DetailDao {
    private QueryRunner qr = new QueryRunner();
    private JdbcConnect connect = new JdbcConnect();

    public Cdetails getDetailCourse(int courseId) {
        Cdetails cdetails = null;
        String sql = "select * from cdetails where did=" + courseId;
        try {
            cdetails = qr.query(connect.getCon(), sql, new BeanHandler<Cdetails>(Cdetails.class));
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("获取详细课程失败");
        }

        return cdetails;
    }
}
