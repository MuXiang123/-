//StatisticsServlet.java
package servlet;

import db.StatisticsDB;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


public class StatisticsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        response.setContentType("gb2312");
        PrintWriter out=response.getWriter();
        JSONObject jsonObject=new JSONObject();
        String date1=request.getParameter("date1");
        String date2=request.getParameter("date2");
        String sql="select * from overall where YearMonthDay >='"+date1+"' and YearMonthDay <='"+date2+"'";
        JSONArray result=null;
        try{
            StatisticsDB sdb = new StatisticsDB();
            result = JSONArray.fromObject(sdb.statisticsList(sql));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        jsonObject.put("data",result);
        //System.out.println(jsonObject.toString());
        out.println(jsonObject.toString());
        out.flush();
        out.close();
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }
}
