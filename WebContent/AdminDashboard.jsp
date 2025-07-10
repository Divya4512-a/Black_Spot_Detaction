<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.BlackSpoatDetection.DB.DBConnect"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

int policeCount = 0, messageCount = 0, spotCount = 0;

try {
	Connection con = DBConnect.getConnection();
	Statement st = con.createStatement();

	ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM police_station");
	if (rs1.next())
		policeCount = rs1.getInt(1);

	ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM blackspots");
	if (rs3.next())
		spotCount = rs3.getInt(1);

	con.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<style>
body {
	margin: 0;
	font-family: 'Segoe UI', sans-serif;
	background-color: #f1f3f5;
	display: flex;
}

.sidebar {
	width: 240px;
	background-color: #2c3e50;
	color: white;
	padding: 20px 0;
	position: fixed;
	height: 100vh;
}

.sidebar h2 {
	text-align: center;
	font-size: 20px;
	margin-bottom: 30px;
}

.sidebar a {
	display: block;
	padding: 12px 20px;
	color: white;
	text-decoration: none;
}

.sidebar a:hover {
	background-color: #34495e;
}

.main-content {
	margin-left: 240px;
	padding: 40px;
	width: calc(100% - 240px);
}

.main-content h1 {
	margin-bottom: 30px;
	font-size: 26px;
	color: #333;
}

.dashboard-cards {
	display: flex;
	gap: 30px;
	flex-wrap: wrap;
}

.card {
	flex: 1;
	min-width: 250px;
	background: linear-gradient(145deg, #ffffff, #e0e0e0);
	border-radius: 12px;
	padding: 30px;
	text-align: center;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.card h2 {
	font-size: 40px;
	color: #007bff;
	margin-bottom: 10px;
}

.card p {
	font-size: 18px;
	font-weight: bold;
	color: #333;
}
</style>
</head>
<body>

	<!-- ✅ Sidebar -->
	<div class="sidebar">
		<h2>Admin Panel</h2>
		<a href="AdminDashboard.jsp">Dashboard</a> <a
			href="AddPoliceStation.jsp">Add Police Station</a> <a
			href="ViewPoliceStations.jsp">View/Delete Police Stations</a> <a
			href="AdminViewBlackSpots.jsp">View Black Spots</a> <a href="Logout.jsp">Logout</a>
	</div>

	<!-- ✅ Main Content -->
	<div class="main-content">
		<h1>Welcome to Admin Panel</h1>

		<div class="dashboard-cards">
			<div class="card">
				<h2><%=policeCount%></h2>
				<p>Police Stations</p>
			</div>

			<div class="card">
				<h2><%=spotCount%></h2>
				<p>Black Spots</p>
			</div>

		</div>
	</div>

</body>
</html>
