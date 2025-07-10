package com.BlackSpotDetaection.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.BlackSpoatDetection.DB.DBConnect; // ✅ Import your DBConnect

@WebServlet("/AddPoliceStationServlet")
public class AddPoliceStationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("stationName");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        boolean success = false;

        try {
            Connection con = DBConnect.getConnection(); 

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO police_station (station_name, address, contact_number, email, password) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, contact);
            ps.setString(4, email);
            ps.setString(5, password);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                success = true;
            }

            ps.close();
            

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (success) {
            session.setAttribute("msg", "Police Station added successfully!");
            session.setAttribute("status", "success");
        } else {
            session.setAttribute("msg", "Failed to add Police Station. Please try again.");
            session.setAttribute("status", "error");
        }

        response.sendRedirect("AddPoliceStation.jsp");
    }
}
