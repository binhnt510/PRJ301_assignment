<%-- 
    Document   : listplan
    Created on : Oct 27, 2024, 10:59:28 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Plan List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
            }
            .header {
                background-color: #1c7eed;
                color: white;
                padding: 10px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
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
            .content-container {
                max-width: 1200px;
                margin: 20px auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            h2 {
                color: #333;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #1c7eed;
                font-size: 24px;
            }

            /* CSS cho bảng */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: #ffffff;
            }

            th {
                background-color: #1c7eed;
                color: white;
                padding: 12px 15px;
                text-align: left;
                font-weight: 500;
            }

            td {
                padding: 12px 15px;
                border-bottom: 1px solid #ddd;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            /* CSS cho link trong bảng */
            table a {
                text-decoration: none;
                color: #1c7eed;
                padding: 6px 12px;
                border: 1px solid #1c7eed;
                border-radius: 4px;
                transition: all 0.3s ease;
                display: inline-block; /* Thêm thuộc tính này để giữ cho link không bị tràn */
                white-space: nowrap; /* Ngăn không cho nhảy hàng */
            }

            table a:hover {
                background-color: #1c7eed;
                color: white;
            }

            /* CSS cho status message */


            /* Thêm kẻ dọc cho bảng */
            table {
                border: 1px solid #ddd; /* Thêm border cho bảng */
            }

            th, td {
                border-right: 1px solid #ddd; /* Thêm border dọc cho các ô */
            }

            td:last-child, th:last-child {
                border-right: none; /* Bỏ border cho cột cuối cùng */
            }
            /* CSS cho các cột cụ thể */
            td:nth-child(1), /* Plan ID */
            td:nth-child(5), /* Department */
            td:nth-child(7), /* Quantity */
            td:nth-child(8) { /* Estimate */
                text-align: center;
            }

            /* CSS cho ngày tháng */
            td:nth-child(3), /* Start Date */
            td:nth-child(4) { /* End Date */
                white-space: nowrap;
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
        <div class="content-container">
            <h2>Plan List</h2>
            <table>
                <tr>
                    <th>Plan ID</th>
                    <th>Plan Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Department</th>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Estimate</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${plans}" var="plan">
                    <tr>
                        <td>${plan.planId}</td>
                        <td>${plan.planName}</td>
                        <td><fmt:formatDate value="${plan.startDate}" pattern="dd-MM-yyyy" /></td>
                        <td><fmt:formatDate value="${plan.endDate}" pattern="dd-MM-yyyy" /></td>
                        <td>${plan.departmentName}</td>
                        <td>${plan.productName}</td>
                        <td>${plan.quantity}</td>
                        <td>${plan.estimate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${empty plan.status}">
                                    <a href="schedulecampain?planCampnID=${plan.planCampnID}&planName=${plan.planName}&startDate=${plan.startDate}&endDate=${plan.endDate}&departmentName=${plan.departmentName}&productName=${plan.productName}&quantity=${plan.quantity}&estimate=${plan.estimate}">Create plan for SchedualCampaign</a>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-message">Plan has created for SchedualCampaign</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

