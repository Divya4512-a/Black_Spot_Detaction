package com.BlackSpotDetection.Police;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/policeLogin")
public class PoliceLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // DB connection
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/blackspotdb", "root", "divya"
            );

            String query = "SELECT * FROM police_station WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("policeEmail", email);
                response.sendRedirect("PoliceDashboard.jsp");
            } else {
                request.setAttribute("errorMsg", "Invalid Email or Password");
                RequestDispatcher rd = request.getRequestDispatcher("PoliceLogin.jsp");
                rd.forward(request, response);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Server error occurred: " + e.getMessage());
            request.getRequestDispatcher("PoliceLogin.jsp").forward(request, response);
        }
    }
}
