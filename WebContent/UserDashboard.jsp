<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
       body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url("images/dashboard1.jpg") no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .dashboard-container {
            padding: 40px;
            width: 90%;
            max-width: 700px;
            border-radius: 15px;
            background: transparent;
            text-align: center;
        }

        h2 {
            color: #ffffff;
            margin-bottom: 20px;
            text-shadow: 1px 1px 3px #000;
        }

        .actions a {
            margin: 12px;
            padding: 12px 24px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            display: inline-block;
            font-weight: bold;
            box-shadow: 2px 2px 8px rgba(0,0,0,0.3);
        }

        .actions a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
%>

<div class="dashboard-container">
    <h2>Welcome, <%= userEmail %>!</h2>
    <div class="actions">
        <a href="ViewSpots.jsp"> View Black Spots</a>
        <a href="Logout.jsp"> Logout</a>
    </div>
</div>

</body>
</html>
