<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.BlackSpoatDetection.DB.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Black Spots</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body style="background-color: rgba(0, 123, 255, 0.2); padding: 40px;">

	<div class="container">
		<h2 class="mb-4 text-center">All Reported Black Spots</h2>
		<table class="table table-bordered table-hover bg-white">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Incident Name</th>
					<th>Description</th>
					<th>Address</th>
					<th>Reason</th>
					<th>Latitude</th>
					<th>Longitude</th>
					<th>Level</th>
					<th>City</th>
					<th>Date</th>
					<th>Added By</th>
				</tr>
			</thead>
			<tbody>
				<%
					try {
					Connection con = DBConnect.getConnection();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("SELECT * FROM blackspots");

					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getInt("id")%></td>
					<td><%=rs.getString("incident_name")%></td>
					<td><%=rs.getString("description")%></td>
					<td><%=rs.getString("address")%></td>
					<td><%=rs.getString("reason")%></td>
					<td><%=rs.getDouble("latitude")%></td>
					<td><%=rs.getDouble("longitude")%></td>
					<td><%=rs.getInt("level")%></td>
					<td><%=rs.getString("city")%></td>
					<td><%=rs.getString("date")%></td>
					<td><%=rs.getString("added_by")%></td>
				</tr>
				<%
					}
				con.close();
				} catch (Exception e) {
				out.println("<tr><td colspan='11' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
				}
				%>
			</tbody>
		</table>
	</div>
	<a href="AdminDashboard.jsp" class="btn btn-primary"> Back to
		Dashboard</a>

</body>
</html>
