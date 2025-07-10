<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*"%>
<%
	String email = (session != null) ? (String) session.getAttribute("policeEmail") : null;
if (email == null) {
	response.sendRedirect("PoliceLogin.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Police Dashboard</title>

<!-- Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">

<style>
body {
	margin: 0;
    padding: 0;
    font-family: 'Segoe UI', sans-serif;
    background: url('images/policedept.jpg') no-repeat center center fixed;
    background-size: cover;
    color: white;
}

.dashboard-container {
	padding-top: 70px;
}

.welcome-box {
	text-align: center;
	margin-bottom: 40px;
}

.card {
	background-color: rgba(0, 123, 255, 0.3);;
	color: white;
	border: none;
	transition: 0.3s;
}

.card:hover {
	transform: scale(1.05);
}

.card i {
	font-size: 40px;
	margin-bottom: 15px;
}

.logout-btn {
	margin-top: 150px;
	text-align: center;
}

.logout-btn a {
	background-color: #dc3545;
	padding: 10px 20px;
	color: white;
	border-radius: 5px;
	text-decoration: none;
}

.logout-btn a:hover {
	background-color: #c82333;
}
</style>
</head>
<body>

	<div class="container dashboard-container">
		<div class="welcome-box">
			<h1>Welcome to Police Station Dashboard</h1>
			<p class="text-light">
				Logged in as: <strong><%=email%></strong>
			</p>
		</div>

		<div class="row g-4 justify-content-center">
			<div class="col-md-3">
				<div class="card p-4 text-center">
					<i class="bi bi-plus-circle-fill"></i>
					<h5>Add Black Spot</h5>
					<a href="AddBlackSpot.jsp" class="btn btn-light mt-3">Add</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card p-4 text-center">
					<i class="bi bi-eye-fill"></i>
					<h5>View Black Spots</h5>
					<a href="ViewBlackSpots.jsp" class="btn btn-light mt-3">View</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card p-4 text-center">
					<i class="bi bi-trash-fill"></i>
					<h5>Delete Black Spot</h5>
					<a href="DeleteBlackSpot.jsp" class="btn btn-light mt-3">Delete</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card p-4 text-center">
					<i class="bi bi-bar-chart-line-fill"></i>
					<h5>Generate Report</h5>
					<a href="GenerateReport.jsp" class="btn btn-light mt-3">Genrate</a>
				</div>
			</div>
		</div>

		<div class="logout-btn">
			<a href="Logout.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a>
		</div>
	</div>

	
</body>
</html>
