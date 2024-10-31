<%-- 
    Document   : create
    Created on : Oct 16, 2024, 4:45:34 PM
    Author     : sonnt-local
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Plan & PlanCampain</title>
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
            .form-container {
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: inline-block;
                width: 120px;
                font-weight: bold;
            }

            .form-group input[type="text"],
            .form-group input[type="date"],
            .form-group select {
                width: calc(100% - 130px);
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .form-group select {
                height: 35px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            input[type="submit"] {
                background-color: #1c7eed;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
            }

            input[type="submit"]:hover {
                background-color: #1666c5;
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
        <div class="form-container">
            <h2 style="text-align: center">Create Plan</h2>
            <form action="createplan" method="POST">
                <div class="form-group">
                    <label for="plan-title">Plan title:</label>
                    <input type="text" id="plan-title" name="name" required />
                </div>
                <div class="form-group">
                    <label for="from">From:</label>
                    <input type="date" id="from" name="from" required />
                </div>
                <div class="form-group">
                    <label for="to">To:</label>
                    <input type="date" id="to" name="to" required />
                </div>
                <div class="form-group">
                    <label for="workshop">Workshop:</label>
                    <select id="workshop" name="did" required>
                        <option value="" disabled selected>----Select Workshop----</option>
                        <c:forEach items="${requestScope.depts}" var="d">
                            <option value="${d.id}">${d.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <table>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Estimate</th>
                    </tr>
                    <c:forEach items="${requestScope.products}" var="p">
                        <tr>
                            <td>${p.name}<input type="hidden" value="${p.id}" name="pid"/></td>
                            <td><input type="text" name="quantity${p.id}"/></td>
                            <td><input type="text" name="cost${p.id}"/></td>
                        </tr>   
                    </c:forEach>
                </table>
                <input type="submit" value="Save"/>
            </form>       
        </div>  
        <script>
            const fromDate = document.getElementById('from');
            const toDate = document.getElementById('to');

            function validateDates() {
                if (toDate.value && fromDate.value) {
                    if (new Date(toDate.value) < new Date(fromDate.value)) {
                        alert('"To" date must be later than the "From" date.');
                        toDate.value = ''; // Clear the "to" date
                    }
                }
            }

            fromDate.addEventListener('change', validateDates);
            toDate.addEventListener('change', validateDates);
        </script>
    </body>
</html>
