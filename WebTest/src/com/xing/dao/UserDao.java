package com.xing.dao;


import com.xing.jdbcUtil.JdbcConnect;
import com.xing.pojo.Users;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDao {
    private QueryRunner qr = new QueryRunner();
    private JdbcConnect connect = new JdbcConnect();

    public Users userLogin(String account) {
        Users user = null;
        String sql = "SELECT * FROM users \n" +
                "WHERE users.uname='" + account + "' \n" +
                "OR users.uemail='" + account + "'\n" +
                "OR users.uphone='" + account + "'";
        try {
            user = qr.query(connect.getCon(), sql, new BeanHandler<>(Users.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
}
