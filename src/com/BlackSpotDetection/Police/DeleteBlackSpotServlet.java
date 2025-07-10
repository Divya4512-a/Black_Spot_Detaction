package com.BlackSpotDetection.Police;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/deleteBlackSpot")
public class DeleteBlackSpotServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        try {
            int id = Integer.parseInt(idStr);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blackspotdb", "root", "divya");

            String sql = "DELETE FROM blackspots WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int result = ps.executeUpdate();

            if (result > 0) {
                request.setAttribute("msg", "Black Spot deleted successfully!");
            } else {
                request.setAttribute("errorMsg", "Failed to delete. Record not found.");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            request.setAttribute("errorMsg", "Server error: " + e.getMessage());
        }

        RequestDispatcher rd = request.getRequestDispatcher("DeleteBlackSpot.jsp");
        rd.forward(request, response);
    }
}
