<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url("images/login.jpg") no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            border-radius: 12px;
            background-color: transprent;
            color: white;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            text-shadow: 1px 1px 3px black;
        }

        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: none;
            border-radius: 6px;
            background-color: rgba(255, 255, 255, 0.9);
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            border-radius: 6px;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .message {
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
        }

        .message span {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 6px 12px;
            border-radius: 5px;
            display: inline-block;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>User Login</h2>
        <form action="userLogin" method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>

        <div class="message">
            <%
                String msg = (String) request.getAttribute("message");
                if (msg != null) {
            %>
                <span><%= msg %></span>
            <%
                }
            %>
        </div>
    </div>

</body>
</html>
