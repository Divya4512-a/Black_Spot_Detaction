<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        height: 100vh;
        background: url('images/adminlogin1.jpg') no-repeat center center fixed;
        background-size: cover;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, sans-serif;
    }

    .login-box {
        width: 400px;
        padding: 30px;
        background-color: transparent ;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    input[type=email], input[type=password] {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    input[type=submit] {
        width: 100%;
        background-color: #007bff;
        color: white;
        padding: 10px;
        margin-top: 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type=submit]:hover {
        background-color: #0056b3;
    }

    .error {
        color: red;
        text-align: center;
        margin-top: 10px;
    }
</style>
</head>
<body>

    <div class="login-box">
        <h2>Admin Login</h2>
        <%
            String error = request.getParameter("error");
            if ("invalid".equals(error)) {
        %>
            <div class="error">Invalid email or password!</div>
        <%
            }
        %>

        <form method="post" action="AdminLoginServlet">
            <input type="email" name="email" placeholder="Admin Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
    </div>

</body>
</html>
