package com.BlackSpotDetection.Police;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/addBlackSpot")
public class AddBlackSpotServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String incidentName = request.getParameter("incident_name");
        String description = request.getParameter("description");
        String address = request.getParameter("address");
        String reason = request.getParameter("reason");
        String latitudeStr = request.getParameter("latitude");
        String longitudeStr = request.getParameter("longitude");
        String levelStr = request.getParameter("level");
        String city = request.getParameter("city");
        String dateStr = request.getParameter("date");
        String addedBy = request.getParameter("added_by");

        try {
            double latitude = Double.parseDouble(latitudeStr);
            double longitude = Double.parseDouble(longitudeStr);
            int level = Integer.parseInt(levelStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blackspotdb", "root", "divya");

            String sql = "INSERT INTO blackspots (incident_name, description, address, reason, latitude, longitude, level, city, date, added_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, incidentName);
            ps.setString(2, description);
            ps.setString(3, address);
            ps.setString(4, reason);
            ps.setDouble(5, latitude);
            ps.setDouble(6, longitude);
            ps.setInt(7, level);
            ps.setString(8, city);
            ps.setDate(9, java.sql.Date.valueOf(dateStr));
            ps.setString(10, addedBy);

            int i = ps.executeUpdate();

            if (i > 0) {
                request.setAttribute("msg", "Black spot added successfully!");
                request.getRequestDispatcher("AddBlackSpot.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMsg", "Failed to add black spot.");
                request.getRequestDispatcher("AddBlackSpot.jsp").forward(request, response);
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Server Error: " + e.getMessage());
            request.getRequestDispatcher("AddBlackSpot.jsp").forward(request, response);
        }
    }
}
