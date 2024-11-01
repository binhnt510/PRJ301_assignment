<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculating Salary</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;

                margin: 0 auto;

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
                margin-bottom: 30px;
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
            /* Form styles */
            form {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            input[type="month"] {
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-right: 10px;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 8px 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            input[type="submit"]:disabled {
                background-color: #cccccc;
                cursor: not-allowed;
            }

            /* Table styles */
            .table-container {
                width: 100%;
                overflow-x: auto;
                position: relative;
                margin-bottom: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            /* Table styles */
            table {
                width: max-content;  /* Để table có thể mở rộng theo nội dung */
                border-collapse: collapse;
                background: white;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: center;
                min-width: 20px; /* Chiều rộng tối thiểu cho các cột ngày */
            }

            /* Cố định 2 cột đầu */
            th:nth-child(1), th:nth-child(2),
            td:nth-child(1), td:nth-child(2) {
                position: sticky;
                background: white; /* Giữ background khi scroll */
                z-index: 1;
            }

            th:nth-child(1), td:nth-child(1) {
                left: 0;
                min-width: 100px; /* Chiều rộng cột ID */
            }

            th:nth-child(2), td:nth-child(2) {
                left: 100px;  /* Phải bằng width của cột trước */
                min-width: 150px; /* Chiều rộng cột Name */
            }

            /* Style cho header */
            th {
                background-color: #f8f9fa !important;
                font-weight: bold;
            }

            /* Style cho cột cuối (Salary) */
            th:last-child, td:last-child {
                min-width: 100px;
            }

            /* Thêm border shadow cho các cột fixed */
            td:nth-child(2)::after {
                content: '';
                position: absolute;
                top: 0;
                right: -5px;
                height: 100%;
                width: 5px;
                background: linear-gradient(to right, rgba(0,0,0,0.1), transparent);
            }

            th {
                background-color: #f8f9fa;
                color: #333;
                font-weight: bold;
                position: sticky;
                top: 0;
            }

            tr:nth-child(even) {
                background-color: #f8f9fa;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            /* Message styles */
            div[style*="color: green"] {
                background-color: #d4edda;
                border-color: #c3e6cb;
                color: #155724;
                padding: 15px;
                border-radius: 4px;
                margin-bottom: 20px;
            }

            /* Salary column styles */
            .salary-column {
                font-weight: bold;
                color: #28a745;
            }

            /* Button container styles */
            .button-container {
                display: flex;
                gap: 10px;
                margin-top: 20px;
                justify-content: flex-start;
            }
            .no-data {
                text-align: center;
                padding: 30px;
                color: #666;
                background-color: #ccffcc;
                border-radius: 8px;
                margin-top: 20px;
                font-size: 20px;
            }
            .choosedate{
                font-size: 20px;
            }
            .choosedate input{
                font-size: 17px;
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
        <form action="salaryworker" method="post" class="choosedate">
            Date: <input type="month" name="monthyear" value="${selectedDate}" required>
            <input type="submit" value="List">
        </form>
        <c:if test="${not empty message}">
            <div style="color: green; margin-bottom: 20px;">
                ${message}
            </div>
        </c:if>

        <c:if test="${empty message}">
            <c:if test="${not empty reports}">
                <div class="table-container">
                    <table>
                        <tr>
                            <th>Employee ID</th>
                            <th>Employee Name</th>
                                <c:forEach begin="1" end="${daysInMonth}" var="day">
                                <th>${day}</th>
                                </c:forEach>
                            <th>Salary</th>
                        </tr>
                        <c:forEach items="${reports}" var="report">
                            <tr>
                                <td>${report.employeeId}</td>
                                <td>${report.employeeName}</td>
                                <c:forEach begin="1" end="${daysInMonth}" var="day">
                                    <td>${report.getStatus(day)}</td>
                                </c:forEach>
                                <td class="salary-column">
                                    <c:if test="${report.calculatedSalary > 0}">
                                        <fmt:formatNumber value="${report.calculatedSalary}" pattern="#,##0" />
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="button-container">
                    <form action="salaryworker" method="post" style="display: inline;" onsubmit="enableSaveButton()">
                        <input type="hidden" name="monthyear" value="${selectedDate}">
                        <input type="hidden" name="action" value="calculate">
                        <input type="submit" value="Calculate Salaries">
                    </form>

                    <form action="salaryworker" method="post" style="display: inline;" onsubmit="return checkEndOfMonth()">
                        <input type="hidden" name="monthyear" value="${selectedDate}">
                        <input type="hidden" name="action" value="save">
                        <input type="submit" id="saveButton" value="Save Salaries" <c:if test="${action != 'calculate'}">disabled</c:if>>
                        </form>
                    </div>
            </c:if>
            <c:if test="${empty reports}">
                <div class="no-data">
                    No attendance records found for the selected month.
                </div>
            </c:if>
        </c:if>
        <script>
            function enableSaveButton() {
                // Kích hoạt nút Save sau khi nhấn Calculate
                document.getElementById('saveButton').disabled = false;
            }

            function checkEndOfMonth() {
                const today = new Date();
                const lastDayOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0).getDate();

                if (today.getDate() !== lastDayOfMonth) {
                    alert("Please note that salaries can only be saved on the last day of the month.");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>