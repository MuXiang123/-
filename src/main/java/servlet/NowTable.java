package servlet;

import db.NowDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class NowTable extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        this.doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/json;charset=UTF-8");
        PrintWriter out=resp.getWriter();
        JSONObject jsonObject = new JSONObject();
        JSONArray result = null;
        NowDao nd = new NowDao();
        result = JSONArray.fromObject( nd.NowTable() );
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",nd.NowTable().size());
        jsonObject.put("data",result);
        System.out.println(result);
        out.println(jsonObject.toString());
        out.flush();
        out.close();
    }
}
