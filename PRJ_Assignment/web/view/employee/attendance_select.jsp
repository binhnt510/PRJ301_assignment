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
            .container {
                width: 90%;               /* Co giãn dựa trên màn hình */
                max-width: 1000px;         /* Giới hạn độ rộng tối đa */
                margin: 30px auto;
                padding: 20px;
                background-color: #f0f8ff;
                border: 1px solid #1e90ff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                font-family: Arial, sans-serif;
            }

            /* Tiêu đề chính */
            .container h1 {
                color: #1e90ff;
                text-align: center;
                font-size: 24px;
                margin-bottom: 15px;
            }

            /* Form chung */
            form {
                margin-bottom: 20px;
            }

            /* Bảng */
            .container table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .container th, .container td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: center;
            }

            .container th {
                background-color: #1e90ff;
                color: white;
                font-weight: bold;
                font-size: 16px;
            }

            .container td {
                background-color: #f9f9f9;
                font-size: 15px;
            }

            /* Input và Select */
            .container input[type="date"],
            .container select,
            .container input[type="number"] {
                width: 95%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
                background-color: #f5f5f5;
                margin-top: 5px;
            }

            /* Nút gửi */
            .container input[type="submit"] {
                background-color: #1e90ff;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 15px;
                width: 100%;
                transition: background-color 0.3s ease;
            }

            .container input[type="submit"]:hover {
                background-color: #1c86ee;
            }

            /* Dòng chữ nổi bật */
            .highlight {
                color: red;
                font-weight: bold;
            }

            /* Thông báo */
            .report-message {
                color: red;
                text-align: center;
                font-size: 16px;
                font-weight: bold;
                margin-top: 20px;
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
        <div class="container">
            <h1>Attendance Management</h1>
            <!-- Form 1: Search Form -->
            <form action="attendance" method="post">
                <input type="hidden" name="action" value="search"/>
                <table>
                    <tr>
                        <td>Date:</td>
                        <td><input type="date" name="date" required value="${searchDate}"/></td>
                    </tr>
                    <tr>
                        <td>Department:</td>
                        <td>

                            <select name="departmentId">
                                <c:forEach items="${requestScope.depts}" var="d">
                                    <option value="${d.id}">${d.name}</option>
                                </c:forEach>
                            </select> 
                        </td>
                    </tr>
                    <tr>
                        <td>Shift:</td>
                        <td>
                            <select name="shift">
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
                    <table border="1">
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
                                    <td>${d.alpha}</td>
                                    <td>${d.note}</td>
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

