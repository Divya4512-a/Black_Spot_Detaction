<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<%@include file="css.jsp"%>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
	background: url("images/registration.jpg") no-repeat center center fixed;
	background-size: cover;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.register-container {
	width: 100%;
	max-width: 450px;
	padding: 30px;
	border-radius: 12px;
	backdrop-filter: blur(10px); /* ✅ Glass effect */
	background-color: rgba(255, 255, 255, 0.1); /* ✅ Transparent */
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
	color: white;
}

.register-container h2 {
	text-align: center;
	margin-bottom: 25px;
	color: #ffffff;
	text-shadow: 1px 1px 4px #000;
}

label {
	margin-bottom: 5px;
	display: block;
	font-weight: 500;
}

.form-control {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: none;
	border-radius: 6px;
	background-color: rgba(255, 255, 255, 0.9);
	font-size: 14px;
}

.btn-primary {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	border: none;
	color: white;
	border-radius: 6px;
	font-size: 16px;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.register-container a {
	color: #ffc107;
	text-decoration: none;
}

.register-container a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="register-container">
		<h2>User Registration</h2>
		
		<form action="register" method="post">
			<label for="fullname">Full Name</label>
			<input type="text" name="fullname" class="form-control" required>

			<label for="email">Email address</label>
			<input type="email" name="email" class="form-control" required>

			<label for="mobile">Mobile Number</label>
			<input type="text" name="mobile" class="form-control" required>

			<label for="city">City</label>
			<input type="text" name="city" class="form-control" required>

			<label for="password">Password</label>
			<input type="password" name="password" class="form-control" required>

			<button type="submit" class="btn btn-primary">Register</button>
		</form>

		<%
		    String msg = (String) request.getAttribute("message");
		    if (msg != null) {
		%>
		    <div style="text-align:center; margin-top:15px; font-weight:bold; font-size:16px; color: white; text-shadow: 1px 1px 3px #000;">
		        <%= msg %>
		    </div>
		<%
		    }
		%>

		<p class="mt-3 text-center">
			Already registered? <a href="UserLogin.jsp">Login here</a>
		</p>
	</div>

</body>
</html>
