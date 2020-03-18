package com.xing.jdbcUtil;

import java.sql.*;

public class JdbcConnect {
    // 数据库地址
    private String dbUrl = "jdbc:mysql://127.0.0.1:3306/wndata?useSSL=false&serverTimezone=CTT";
    // 用户名
    private String dbUserName = "root";
    // 密码
    private String dbPassword = "root";
    // 驱动名称
    private String jdbcName = "com.mysql.cj.jdbc.Driver";

    Connection conn;
    PreparedStatement ps;//代表一条预编译的SQL
    ResultSet rs;//代表结果集

    //获得数据库连接
    public Connection getCon() {
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
