package com.xing.dao;

import com.xing.jdbcUtil.JdbcConnect;
import com.xing.pojo.Cdirectory;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class DirectoryDao {
    private QueryRunner qr = new QueryRunner();
    private JdbcConnect connect = new JdbcConnect();

    public Cdirectory getDetailCourse(int courseId) {
        Cdirectory cdirectory = null;
        String sql = "select * from cdetails where did=" + courseId;

        try {
            cdirectory = qr.query(connect.getCon(), sql, new BeanHandler<>(Cdirectory.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cdirectory;
    }
}
