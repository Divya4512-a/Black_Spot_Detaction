<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Black Spot Detection</title>
<%@include file="css.jsp"%>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f9;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: rgba(0, 0, 0, 0.6);
	padding: 10px 20px;
	color: white;
	position: fixed;
	width: 100%;
	top: 0;
	z-index: 1000;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	backdrop-filter: blur(4px);
}

.navbar .logo h3 {
	margin: 0;
	font-size: 24px;
	font-weight: bold;
	letter-spacing: 1px;
	color: #fff;
}

.links {
	display: flex;
	align-items: center;
}

.navbar a, .dropdown {
	color: white;
	text-decoration: none;
	margin: 0 10px;
	position: relative;
	padding: 8px 12px;
	font-weight: 500;
}

.links a:hover, .dropdown:hover>a {
	background-color: rgba(255, 255, 255, 0.2);
	border-radius: 5px;
}

.dropdown-content {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	background-color: white;
	color: black;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	min-width: 160px;
	border-radius: 4px;
	overflow: hidden;
	z-index: 10;
}

.dropdown-content a {
	color: black;
	padding: 10px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.header-space {
	height: 70px;
}

.carousel img {
	width: 100%;
	height: 90vh;
	object-fit: cover;
}

.position-absolute h1 {
	text-shadow: 2px 2px 5px #000;
}

.btn {
	display: inline-block;
	margin: 20px 10px;
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

.btn:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<div class="navbar">
		<div class="logo">
			<h3>Black Spot Detection</h3>
		</div>
		<div class="links">
			<a href="index.jsp">Home</a> <a href="Register.jsp">Registration</a>

			<div class="dropdown">
				<a href="#">Login ▼</a>
				<div class="dropdown-content">
					<a href="AdminLogin.jsp">Admin Login</a> 
						<a href="PoliceLogin.jsp">Police Station Login</a>
						<a href="UserLogin.jsp">User Login</a>
				</div>
			</div>
		</div>
	</div>

	<div class="header-space"></div>

	<div id="spotCarousel" class="carousel slide position-relative"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/spot3.jpg" class="d-block w-100"
					alt="Black Spot Identification">
			</div>
			<div class="carousel-item">
				<img src="images/spot2.jpg" class="d-block w-100"
					alt="Safety Planning">
			</div>
		</div>



		<button class="carousel-control-prev" type="button"
			data-bs-target="#spotCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#spotCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>

	<%@include file="Footer.jsp"%>
</body>
</html>
