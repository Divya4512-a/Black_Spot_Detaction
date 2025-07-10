<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*"%>
<%
	String addedBy = (session != null) ? (String) session.getAttribute("policeEmail") : null;
if (addedBy == null) {
	response.sendRedirect("PoliceLogin.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Black Spot</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: #f0f8ff;
	padding: 40px;
	
}

.form-container {
	background-color: #ffffff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	max-width: 700px;
	margin: auto;
}
</style>
</head>
<body>
	<div class="form-container">
		<h3 class="mb-4 text-center">Add Black Spot</h3>
		<%
			if (request.getAttribute("msg") != null) {
		%>
		<div class="alert alert-success"><%=request.getAttribute("msg")%></div>
		<%
			} else if (request.getAttribute("errorMsg") != null) {
		%>
		<div class="alert alert-danger"><%=request.getAttribute("errorMsg")%></div>
		<%
			}
		%>

		<form action="addBlackSpot" method="post">
			<div class="mb-3">
				<label class="form-label">Incident Name</label> <input type="text"
					name="incident_name" class="form-control" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Description</label>
				<textarea name="description" class="form-control" rows="3" required></textarea>
			</div>
			<div class="mb-3">
				<label class="form-label">Address</label>
				<textarea name="address" class="form-control" rows="2" required></textarea>
			</div>
			<div class="mb-3">
				<label class="form-label">Reason</label> <select name="reason"
					class="form-select" required>
					<option value="accident">Accident</option>
					<option value="crime">Crime</option>
				</select>
			</div>
			<div class="mb-3">
				<label class="form-label">Latitude</label> <input type="number"
					step="any" name="latitude" class="form-control" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Longitude</label> <input type="number"
					step="any" name="longitude" class="form-control" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Level</label> <select name="level"
					class="form-select" required>
					<option value="0">Low</option>
					<option value="1">Medium</option>
					<option value="2">High</option>
				</select>
			</div>
			<div class="mb-3">
				<label class="form-label">City</label> <input type="text"
					name="city" class="form-control" required>
			</div>
			<div class="mb-3">
				<label class="form-label">Date of Incident</label> <input
					type="date" name="date" class="form-control" required>
			</div>

			<input type="hidden" name="added_by" value="<%=addedBy%>">

			<button type="submit" class="btn btn-primary w-100">Submit</button>
			<div class="text-center mt-4 ">
				<a href="PoliceDashboard.jsp" class="btn btn-primary"> ← Back to
					Dashboard </a>
			</div>

		</form>
	</div>
</body>
</html>
