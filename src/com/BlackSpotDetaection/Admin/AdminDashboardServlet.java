package com.BlackSpotDetaection.Admin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("adminEmail") != null) {
            RequestDispatcher rd = request.getRequestDispatcher("AdminDashboard.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("AdminLogin.jsp");
        }
    }
}
