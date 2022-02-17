package db;


import db.util.ConnectUtil;
import model.Statistics;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

public class StatisticsDB {
    private static final Object UTC= TimeZone.getTimeZone("UTC");
    Connection ct;
    PreparedStatement pstmt;
    String url;
    String user;
    String password;

    public StatisticsDB(){
        ct = ConnectUtil.connection();
    }


    public List<Statistics> statisticsList (String sql) throws SQLException {
        try{
            List<Statistics> list = new ArrayList<>();
            pstmt=ct.prepareStatement(sql);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()){
                Statistics st=new Statistics();
                st.setDate(new java.util.Date(rs.getDate(1).getTime()));
                st.setGuestnum(rs.getInt(2));
                st.setReservedroom(rs.getInt(3));
                st.setCredit(rs.getInt(4));
                st.setProfit(rs.getInt(5));
                st.setAddguest(rs.getInt(6));
                list.add(st);
            }
            return list;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
