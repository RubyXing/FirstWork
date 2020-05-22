package com.xing.dao;

import com.xing.jdbcUtil.JdbcConnect;
import com.xing.pojo.Courselist;
import com.xing.pojo.Ldetail;
import com.xing.pojo.Orderlist;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

public class OrderDao {
    private QueryRunner qr = new QueryRunner();
    private JdbcConnect connect = new JdbcConnect();


    public HashMap<String, Object> getOrder(int userid) {
        HashMap<String, Object> orderlist = new HashMap<>();
        String sql1 = "SELECT * FROM orderlist WHERE uid=" + userid + " ORDER BY ldate DESC";
        String sql2 = "SELECT * FROM ldetail WHERE oid IN (SELECT lid FROM orderlist WHERE uid=" + userid + " )";
        try {
            List<Orderlist> orderQuery = qr.query(connect.getCon(), sql1, new BeanListHandler<>(Orderlist.class));
            List<Ldetail> detailQuery = qr.query(connect.getCon(), sql2, new BeanListHandler<>(Ldetail.class));
            orderlist.put("orderlist", orderQuery);
            orderlist.put("orderdetail", detailQuery);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderlist;
    }

    public void cToOrder(int userId, List<Courselist> course) {
        Random random = new Random();
        int oid = (int) (random.nextDouble() * (99999 - 10000 + 1)) + 10000;
        String sqlIn = "INSERT INTO orderlist(lid,uid,ldate,lstate) VALUES(?,?,NOW(),0)";
        String sqlC = "INSERT INTO ldetail (oid,cid,lnum,cname,cimg,lprice) VALUES(?,?,?,?,?,?)";
        double totalmoney = 0;
        try {
            qr.update(connect.getCon(), sqlIn, oid, userId);
            for (Courselist cou : course) {
                qr.update(connect.getCon(), sqlC, oid, cou.getCid(), 1, cou.getCname(), cou.getCimgaddress(), cou.getCprice() * cou.getCrebate());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
