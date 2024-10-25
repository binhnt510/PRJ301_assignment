<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                margin: 0;
                padding: 20px;
            }

            h1 {
                color: #333;
                margin-bottom: 20px;
                margin-left: 0; /* Đảm bảo tiêu đề nằm bên trái */
            }

            table {
                border-collapse: collapse;
                width: 80vw; /* Chiếm 80% chiều rộng viewport */
                table-layout: fixed; /* Cố định độ rộng các cột */
                font-size: 13px; /* Giảm kích thước chữ */
            }

            th, td {
                border: 1px solid #ddd;
                padding: 4px 2px; /* Giảm padding */
                text-align: center;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

            /* Cột Employee Name rộng hơn */
            th:first-child, td:first-child {
                width: 180px;
                background-color: white;
            }

            /* Các cột ngày có độ rộng bằng nhau */
            th:not(:first-child), td:not(:first-child) {
                width: calc((80vw - 180px) / 31); /* Chia đều độ rộng còn lại cho 31 ngày */
            }

            th {
                background-color: #4CAF50;
                color: white;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            /* Style cho các trạng thái */
            td:not(:first-child) {
                font-weight: bold;
            }

            /* Màu cho các trạng thái chấm công khác nhau */
            td[data-status="P"] {
                color: #28a745;
            }

            td[data-status="A"] {
                color: #dc3545;
            }
        </style>
    </head>
    <body>
        <h1>Employee Attendance Report</h1>
        <table>
            <tr>
                <th style="background-color:#4CAF50 ">Employee Name</th>
                <c:forEach begin="1" end="31" var="day">
                    <th>${day}</th>
                </c:forEach>
            </tr>
            <c:forEach items="${reports}" var="report">
                <tr>
                    <td title="${report.employeeName}">${report.employeeName}</td>
                    <c:forEach begin="1" end="31" var="day">
                        <td data-status="${report.getStatus(day)}">${report.getStatus(day)}</td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>