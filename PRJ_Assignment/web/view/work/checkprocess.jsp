<%-- 
    Document   : searchplan
    Created on : Oct 26, 2024, 11:56:04 AM
    Author     : admin
--%>

<!-- view/work/searchplan.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <title>Search Plan</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body {
                background-color: #f5f5f5;
                
                min-height: 100vh;
            }
            .header {
                background-color: #1c7eed;
                color: white;
                padding: 10px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 90px;
                position: relative;
            }
            .home-btn {
                display: flex;
                align-items: center;
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
            }
            .home-btn i {
                margin-right: 5px;
            }
            .home-btn:hover {
                background-color: #45a049;
            }
            .title {
                font-size: 24px;
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
                text-align: center;

            }
            .title img{
                border-radius: 10px;
                width: 80px;
                height: 35px;
                margin-bottom: 5px;
            }
            .right-controls p{
                color: orange;
                margin: 0;
                margin-right: 5px;
            }
            .right-controls {
                display: flex;
                align-items: center;
            }
            .right-controls ul{
                list-style: none;
            }
            .right-controls li{
                display: flex;
                text-align: center;
            }

            .profile-icon img {

                padding: 10px;
                border-radius: 50%;
                text-align: center;
                width: 45px;
                height: 45px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
            }
            .logout {
                background-color: #e14d4d;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
            }
            .logout:hover {
                background-color: #ff0000;
            }
            .search-form {
                background: white;
                padding: 25px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                margin-top: 30px;
                margin-bottom: 30px;
                max-width: 800px;
                margin-left: auto;
                margin-right: auto;
                
            }

            .search-form form {
                display: flex;
                gap: 15px;
                align-items: center;
                flex-wrap: wrap;
                
            }

            label {
                font-weight: 600;
                color: #333;
            }

            select {
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
                min-width: 200px;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: 500;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                background: white;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            th, td {
                border: 1px solid #eee;
                padding: 12px 15px;
                text-align: left;
            }

            th {
                background-color: #f8f9fa;
                font-weight: 600;
                color: #333;
                text-transform: uppercase;
                font-size: 14px;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f5f5f5;
            }
            .status-not-started{
                color: black;
                font-weight: 500;
            }
            .status-ongoing {
                color: #2196F3;
                font-weight: 500;
            }

            .status-late {
                color: #f44336;
                font-weight: 500;
            }

            .status-complete {
                color: #4CAF50;
                font-weight: 500;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <a href="http://localhost:9999/ta.com/home" class="home-btn"><i class="fas fa-home"></i> Home</a>
            <div class="title">
                <img src="http://localhost:9999/ta.com/img/logo123.jpg">
                <div >Công ty thủ công mỹ nghệ Thế Anh</div>
            </div>
            <div class="right-controls">
                <ul>
                    <li><p>Username: </p> ${sessionScope.account.username}</li>
                    <li> ${sessionScope.account.displayname}</li>
                </ul>
                <div class="profile-icon"><img src="http://localhost:9999/ta.com/img/abstract-user-flat-4.png"></div>
                <a class="logout" href="http://localhost:9999/ta.com/logout"><i class="fas fa-sign-out-alt"></i></a>
            </div>
        </div>
        <div class="search-form" >
            <form action="checkprocess" method="POST">
                <label for="planName">Plan Name:</label>
                <select name="planName" required id="planName" >
                    <c:forEach items="${requestScope.planName}" var="p">
                        <option value="${p.name}">${p.name}</option>
                    </c:forEach>
                </select>
                <input type="submit" value="Search"/>
            </form>
        </div>

        <c:if test="${not empty details}">
            <table>
                <thead>
                    <tr>
                        <th>Plan ID</th>
                        <th>Plan Name</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Department Name</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Estimate</th>
                        <th>Quantity Accomplished</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${details}" var="d">
                        <tr>
                            <td>${d.planId}</td>
                            <td>${d.planName}</td>
                            <td><fmt:formatDate value="${d.startDate}" pattern="dd-MM-yyyy" /></td>
                            <td><fmt:formatDate value="${d.endDate}" pattern="dd-MM-yyyy" /></td>
                            <td>${d.departmentName}</td>
                            <td>${d.productName}</td>
                            <td>${d.quantity}</td>
                            <td>${d.estimate}</td>
                            <td>${d.accomplishedQuantity}</td>
                            <td class="status-${d.status.replace(' ', '')}">${d.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>