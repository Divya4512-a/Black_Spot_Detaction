<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
    <title>View Black Spots</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f8f9fa; padding: 40px;">

    <div class="container">
        <h2 class="mb-4 text-center">Black Spots Added by You</h2>
        <table class="table table-bordered table-hover bg-white">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Incident Name</th>
                    <th>Address</th>
                    <th>Reason</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Level</th>
                    <th>City</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blackspotdb", "root", "divya");

                    String query = "SELECT * FROM blackspots WHERE added_by=?";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, addedBy);
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("incident_name") %></td>
                    <td><%= rs.getString("address") %></td>
                    <td><%= rs.getString("reason") %></td>
                    <td><%= rs.getDouble("latitude") %></td>
                    <td><%= rs.getDouble("longitude") %></td>
                    <td><%= rs.getInt("level") %></td>
                    <td><%= rs.getString("city") %></td>
                    <td><%= rs.getString("date") %></td>
                </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='9' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
            </tbody>
        </table>

        <div class="text-center mt-4">
            <a href="PoliceDashboard.jsp" class="btn btn-primary">← Back to Dashboard</a>
        </div>
    </div>

</body>
</html>
