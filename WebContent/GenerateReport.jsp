<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    String addedBy = (String) session.getAttribute("policeEmail");
    if (addedBy == null) {
        response.sendRedirect("PoliceLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Black Spot Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #eef2f7; padding: 40px;">
    <div class="container">
        <h2 class="mb-4 text-center">Black Spot Report Summary</h2>
        <%
            int total = 0, accident = 0, crime = 0;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blackspotdb", "root", "divya");

                PreparedStatement totalPs = con.prepareStatement("SELECT COUNT(*) FROM blackspots WHERE added_by=?");
                totalPs.setString(1, addedBy);
                ResultSet totalRs = totalPs.executeQuery();
                if (totalRs.next()) total = totalRs.getInt(1);

                PreparedStatement accidentPs = con.prepareStatement("SELECT COUNT(*) FROM blackspots WHERE added_by=? AND reason='accident'");
                accidentPs.setString(1, addedBy);
                ResultSet accidentRs = accidentPs.executeQuery();
                if (accidentRs.next()) accident = accidentRs.getInt(1);

                PreparedStatement crimePs = con.prepareStatement("SELECT COUNT(*) FROM blackspots WHERE added_by=? AND reason='crime'");
                crimePs.setString(1, addedBy);
                ResultSet crimeRs = crimePs.executeQuery();
                if (crimeRs.next()) crime = crimeRs.getInt(1);

                con.close();
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            }
        %>

        <div class="row g-4 justify-content-center text-center">
            <div class="col-md-4">
                <div class="card bg-primary text-white p-4">
                    <h4>Total Black Spots</h4>
                    <h2><%= total %></h2>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-danger text-white p-4">
                    <h4>Accidents</h4>
                    <h2><%= accident %></h2>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-dark text-white p-4">
                    <h4>Crimes</h4>
                    <h2><%= crime %></h2>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="PoliceDashboard.jsp" class="btn btn-primary"> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
