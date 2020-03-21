package com.xing.dao;

import com.xing.jdbcUtil.JdbcConnect;
import com.xing.pojo.Ctag;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class TagDao {
    private QueryRunner qr = new QueryRunner();
    private JdbcConnect connect = new JdbcConnect();

    //获得所有标签
    public List<Ctag> getShowList() {
        List<Ctag> query = null;
        try {
            query = qr.query(connect.getCon(), "select * from ctag", new BeanListHandler<Ctag>(Ctag.class));
            query.forEach(System.out::println);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }


}
