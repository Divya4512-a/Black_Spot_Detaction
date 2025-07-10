<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>City-wise Black Spots</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: url('images/spot4.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .search-box {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin-bottom: 30px;
        }

        input[type="text"] {
            padding: 10px;
            width: 250px;
            border-radius: 5px;
            border: 1px solid #999;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
        }

        table {
            width: 90%;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.97);
        }

        th, td {
            padding: 12px;
            border: 1px solid #999;
            text-align: center;
        }

        th {
            background-color: #333;
            color: white;
        }

        .home-btn {
            margin-top: 30px;
        }

        .home-btn input {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .home-btn input:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <div class="search-box">
        <h2>Search Black Spots by City</h2>
        <form method="get" action="viewSpots">
            <input type="text" name="city" placeholder="Enter city name" value="${param.city}">
            <input type="submit" value="Search">
        </form>
    </div>

    <c:if test="${not empty param.city}">
        <table>
            <tr>
                <th>City</th>
                <th>Incident Name</th>
                <th>Description</th>
            </tr>
            <c:choose>
                <c:when test="${not empty spotList}">
                    <c:forEach var="row" items="${spotList}">
                        <tr>
                            <td>${row[0]}</td>
                            <td>${row[1]}</td>
                            <td>${row[2]}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="3">No black spots found in <strong>${param.city}</strong>.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>
    </c:if>

    <div class="home-btn">
        <form action="index.jsp">
            <input type="submit" value="Go to Home">
        </form>
    </div>

</body>
</html>
