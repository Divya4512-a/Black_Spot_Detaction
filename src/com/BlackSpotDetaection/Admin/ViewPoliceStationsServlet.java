package com.BlackSpotDetaection.Admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/ViewPoliceStationsServlet")
public class ViewPoliceStationsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        HttpSession session = request.getSession();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blackspotdb", "root", "divya");
            PreparedStatement ps = con.prepareStatement("DELETE FROM police_station WHERE id = ?");
            ps.setString(1, id);

            int rows = ps.executeUpdate();
            con.close();

            if (rows > 0) {
                session.setAttribute("msg", "Police station deleted successfully!");
            } else {
                session.setAttribute("msg", "Failed to delete police station.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("msg", "Error occurred during deletion.");
        }

        response.sendRedirect("ViewPoliceStations.jsp");
    }
}
