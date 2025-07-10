<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Police Stations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .delete-btn {
            background-color: red;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .msg {
            text-align: center;
            color: green;
            font-weight: bold;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<h2>All Registered Police Stations</h2>

<%
    String msg = (String) session.getAttribute("msg");
    if (msg != null) {
%>
    <div class="msg"><%= msg %></div>
<%
        session.removeAttribute("msg");
    }
%>

<table>
    <tr>
        <th>ID</th>
        <th>Station Name</th>
        <th>Address</th>
        <th>Contact</th>
        <th>Email</th>
        <th>Action</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blackspotdb", "root", "divya");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM police_station");

        boolean found = false;
        while (rs.next()) {
            found = true;
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("station_name") %></td>
        <td><%= rs.getString("address") %></td>
        <td><%= rs.getString("contact_number") %></td>
        <td><%= rs.getString("email") %></td>
        <td>
            <form action="DeletePoliceStationServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this station?');">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <input type="submit" value="Delete" class="delete-btn">
            </form>
        </td>
    </tr>
<%
        }
        if (!found) {
%>
    <tr>
        <td colspan="6">No police stations found.</td>
    </tr>
<%
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>

</body>
</html>
