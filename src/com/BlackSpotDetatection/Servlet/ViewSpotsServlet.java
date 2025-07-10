package com.BlackSpotDetatection.Servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/viewSpots")
public class ViewSpotsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String city = request.getParameter("city");
        ArrayList<String[]> spotList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blackspotdb", "root", "divya");

            String sql = "SELECT city, incident_name, description FROM blackspots";
            PreparedStatement stmt;

            if (city != null && !city.trim().isEmpty()) {
                sql += " WHERE city LIKE ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, "%" + city + "%");
            } else {
                stmt = conn.prepareStatement(sql);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String[] row = new String[3];
                row[0] = rs.getString("city");
                row[1] = rs.getString("incident_name");
                row[2] = rs.getString("description");
                spotList.add(row);
            }

            request.setAttribute("spotList", spotList);

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewSpots.jsp");
        dispatcher.forward(request, response);
    }
}
