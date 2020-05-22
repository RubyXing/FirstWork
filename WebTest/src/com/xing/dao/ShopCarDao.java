package com.xing.dao;

import com.xing.jdbcUtil.JdbcConnect;
import com.xing.pojo.Courselist;
import com.xing.pojo.Shopcar;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public class ShopCarDao {
    private QueryRunner qr = new QueryRunner();
    private JdbcConnect connect = new JdbcConnect();

    public void addProduct(int courseid, int userid) {
        String sql1 = "SELECT * FROM shopcar WHERE cid=" + courseid + " AND uid=" + userid;
        String sql2 = "INSERT INTO shopcar (cid,uid) VALUES (?,?)";
        String sql3 = "UPDATE shopcar SET snum=? WHERE cid=? AND uid=?";

        int update;
        try {
            Shopcar query = qr.query(connect.getCon(), sql1, new BeanHandler<>(Shopcar.class));
            if (query != null) {
                update = qr.update(connect.getCon(), sql3, query.getSnum() + 1, courseid, userid);
            } else {
                update = qr.update(connect.getCon(), sql2, courseid, userid);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public HashMap<String, Object> listShop(int userid) {
        String shopSql = "SELECT * FROM shopcar WHERE uid=" + userid;
        String courseSql = "SELECT * FROM courselist WHERE" +
                " cid IN(SELECT cid FROM shopcar WHERE uid=" + userid + ")";

        HashMap<String, Object> shopping = new HashMap<>();
        List<Shopcar> shopcar = null;
        List<Courselist> courselist = null;
        try {
            shopcar = qr.query(connect.getCon(), shopSql, new BeanListHandler<>(Shopcar.class));
            courselist = qr.query(connect.getCon(), courseSql, new BeanListHandler<>(Courselist.class));
            shopping.put("shopcar", shopcar);
            shopping.put("course", courselist);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shopping;
    }

    public void deleteOne(int userID, int courseId) {
        String sql = "DELETE FROM shopcar WHERE uid =? AND cid =?";
        try {
            int update = qr.update(connect.getCon(), sql, userID, courseId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteAll(int userId) {
        String sql = "DELETE FROM shopcar WHERE uid =?";
        try {
            int update = qr.update(connect.getCon(), sql, userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
