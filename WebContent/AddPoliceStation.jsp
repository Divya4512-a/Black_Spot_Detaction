<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String msg = (String) session.getAttribute("msg");
    String status = (String) session.getAttribute("status");
    session.removeAttribute("msg");
    session.removeAttribute("status");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Police Station</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .form-container {
            width: 500px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        h2 {
            text-align: center;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type=submit], .dashboard-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            width: 100%;
        }
        input[type=submit]:hover, .dashboard-btn:hover {
            background-color: #0056b3;
        }
        .message {
            text-align: center;
            color: <%= "success".equals(status) ? "green" : "red" %>;
            margin-bottom: 15px;
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add Police Station</h2>

    <% if (msg != null) { %>
        <div class="message"><%= msg %></div>
    <% } %>

    <form action="AddPoliceStationServlet" method="post">
        <input type="text" name="stationName" placeholder="Station Name" required>
        <textarea name="address" placeholder="Address" required></textarea>
        <input type="text" name="contact" placeholder="Contact Number" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Add Station">
    </form>

    <!-- ✅ Dashboard Button -->
    <div class="btn-container">
        <form action="AdminDashboard.jsp">
            <button type="submit" class="dashboard-btn">← Back to Dashboard</button>
        </form>
    </div>
</div>
</body>
</html>
