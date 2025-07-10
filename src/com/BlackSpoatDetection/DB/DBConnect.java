package com.BlackSpoatDetection.DB;

import java.sql.*;

public class DBConnect {
    private static Connection conn;

    public static Connection getConnection() throws Exception {
        if (conn == null || conn.isClosed()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/blackspotdb", "root", "divya");
        }
        return conn;
    }
}
