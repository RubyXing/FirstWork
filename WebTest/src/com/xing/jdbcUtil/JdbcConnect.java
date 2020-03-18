package com.xing.jdbcUtil;

import java.io.File;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class JdbcConnect {

    Connection conn;
    PreparedStatement ps;//代表一条预编译的SQL
    ResultSet rs;//代表结果集

    //获得数据库连接
    public Connection getCon() {
        Properties properties = new Properties();
        try {
            properties.load(this.getClass().getClassLoader().getResourceAsStream("database.properties"));
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("加载数据库属性异常");
        }
        // 数据库地址
        String dbUrl = properties.getProperty("dbUrl");
        // 用户名
        String dbUserName = properties.getProperty("dbUserName");
        // 密码
        String dbPassword = properties.getProperty("dbPassword");
        // 驱动名称
        String jdbcName = properties.getProperty("jdbcName");


        try {
            Class.forName(jdbcName);
            System.out.println("加载驱动成功！");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("加载驱动失败！");
        }

        Connection con = null;

        try {
            // 获取数据库连接
            con = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);
            System.out.println("获取数据库连接成功！");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("获取数据库连接失败！");
        }

        return con;
    }

    //带参数增删改
    public int executeUpdate(String sql, Object... params) {
        int nums = 0;
        try {
            conn = getCon();
            ps = conn.prepareStatement(sql);
            int i = 0;
            for (Object p : params) {
                ps.setObject(i + 1, p);
                i++;
            }
            nums = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("带参增删改异常");
        }
        return nums;
    }

    //无参增删改
    public int executeUpdate(String sql) {
        int nums = 0;
        try {
            conn = getCon();
            ps = conn.prepareStatement(sql);
            nums = ps.executeUpdate();
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            System.out.println("无参数增删改异常");
        }
        return nums;
    }

    //查询
    public ResultSet executeQuery(String sql, Object... params) {
        try {
            conn = getCon();
            ps = conn.prepareStatement(sql);
            int i = 0;
            for (Object p : params) {
                ps.setObject(i + 1, p);
                i++;
            }
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("数据查询异常");
        }
        return rs;
    }

    public void close() {
        try {
            if (conn != null) {
                conn.close();
                conn = null;
            }
            if (ps != null) {
                ps.close();
                ps = null;
            }
            if (rs != null) {
                rs.close();
                rs = null;
            }
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("关闭连接异常");
        }
    }
}
