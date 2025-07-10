package com.BlackSpotDetatection.Servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import com.BlackSpoatDetection.DB.DBConnect;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String city = request.getParameter("city");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnect.getConnection();
            String sql = "INSERT INTO users (name, email, mobile, city, password) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, city);
            ps.setString(5, password);

            int i = ps.executeUpdate();
            if (i > 0) {
                request.setAttribute("message", " Registration Successful!");
            } else {
                request.setAttribute("message", " Registration Failed. Try Again.");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
        }

        RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
        rd.forward(request, response);
    }
}
