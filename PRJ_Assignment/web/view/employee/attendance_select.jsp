<%-- 
    Document   : attendance
    Created on : Oct 23, 2024, 12:04:45 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <title>Attendance Management</title>
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
            h1 {
                color: #2c3e50;
                text-align: center;
                margin-bottom: 30px;
            }
            #attendance{
                font-size: 20px;
            }
            #attendance select{
                font-size: 20px;
            }
            #attendance input{
                font-size: 20px;
            }
            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin: 0 auto; /* Căn giữa form */
                max-width: 90%; /* Giới hạn chiều rộng form tối đa 90% */
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                table-layout: fixed; /* Chia đều chiều rộng các cột */
            }

            th, td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
                word-wrap: break-word; /* Cho phép ngắt dòng trong ô */
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            input[type="date"], select {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #3498db;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #2980b9;
            }

            .report-message {
                text-align: center;
                margin-top: 20px;
                color: red;
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
        <div>
            <h1>Attendance Management</h1>
            <!-- Form 1: Search Form -->
            <form action="attendance" method="post">
                <input type="hidden" name="action" value="search"/>
                <table id="attendance">
                    <tr>
                        <td>Date</td>
                        <td><input type="date" name="date" required value="${searchDate}"/></td>
                    </tr>
                    <tr>
                        <td>Department <span style="color: red; font-size: 17px; text-align: center"> (Please select your correct department)</span></td>
                        <td>

                            <select name="departmentId" required>
                                <option value="" disabled selected>----Select Workshop----</option>
                                <c:forEach items="${requestScope.depts}" var="d">
                                    <option value="${d.id}">${d.name}</option>
                                </c:forEach>
                            </select> 
                        </td>

                    </tr>
                    <tr>
                        <td>Shift<span style="color: red; font-size: 17px; text-align: center"> (Please select your correct shift number)</span></td>
                        <td>
                            <select name="shift" required>
                                <option value="K1">K1</option>
                                <option value="K2">K2</option>
                                <option value="K3">K3</option>
                            </select> 
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Search for inserting the attendance of workers" name="search1"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Check the saved attendance of workers"" name="check" />
                        </td>
                    </tr>
                </table>
            </form>

            <!-- Form 2: Attendance Details -->
            <c:if test="${not empty details}">
                <form action="attendance" method="post">
                    <input type="hidden" name="action" value="check"/>
                    <h1>Attendance at <span style="color: red"> ${requestScope.depname}</span> -- <span style="color: red" id="dateDisplay">${searchDate}</span> -- Production shift: <span style="color: red">${searchShift}</span> </h1>
                    <table id="table2" border="1">
                        <thead>
                            <tr>
                                <th>Employee ID</th>
                                <th>Employee Name</th>
                                <th>Product Name</th>
                                <th>Ordered Quantity</th>
                                <th>Actual Quantity</th>
                                <th>Alpha</th>
                                <th>Note</th>
                                <th>Createby</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${details}" var="d">
                                <tr>
                                    <c:choose>
                                        <c:when test="${d.rowSpan > 0}">
                                            <td rowspan="${d.rowSpan}">${d.employeeId}</td>
                                            <td rowspan="${d.rowSpan}">${d.employeeName}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- Bỏ style="display: none" để tránh lỗi layout -->
                                            <!-- Không cần tạo các ô TD cho những hàng đã được gộp -->
                                        </c:otherwise>
                                    </c:choose>
                                    <td>${d.productName}</td>
                                    <td>${d.orderedQuantity}</td>
                                    <td>${d.actualQuantity}</td>
                                    <c:choose>
                                        <c:when test="${d.rowSpan > 0}">
                                            <td rowspan="${d.rowSpan}">${d.alpha}</td>
                                            <td rowspan="${d.rowSpan}">${d.note}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- Bỏ style="display: none" để tránh lỗi layout -->
                                            <!-- Không cần tạo các ô TD cho những hàng đã được gộp -->
                                        </c:otherwise>
                                    </c:choose>

                                    
                                    <td>${d.createBy}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </c:if>
            <h1 style="color: red" class="report-message" >${report}</h1>
        </div>
        <script>
            // Ví dụ biến searchDate có giá trị yyyy-mm-dd
            var searchDate = "${searchDate}";

            // Hàm để chuyển đổi sang dd-mm-yyyy
            function formatDate(dateString) {
                var dateParts = dateString.split("-");
                return dateParts[2] + "/" + dateParts[1] + "/" + dateParts[0];
            }

            // Chuyển đổi và hiển thị trong thẻ h1
            document.getElementById('dateDisplay').innerHTML = formatDate(searchDate);
        </script>
    </body>
</html>

