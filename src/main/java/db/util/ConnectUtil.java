package db.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * mysql连接工具类
 */
public class ConnectUtil {
    static Connection ct;
    static String url;
    static String user;
    static String password;

    /**
     * 直接调用方法，返回connection对象。
     * @return
     */
    public static Connection connection() {
        url= "jdbc:mysql://localhost:3306/hotel?characterEncoding=UTF-8"+"&serverTimezone=UTC";
        user ="root";
        password ="root";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            ct= DriverManager.getConnection(url,user,password);
        }catch(Exception e){
            e.printStackTrace();
        }
        return ct;
    }
}
