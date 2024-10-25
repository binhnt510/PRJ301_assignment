<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance Report</title>
        <style>
            table {
                border-collapse: collapse;
                width: 80vw;
                table-layout: auto;
                font-size: 13px;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: center;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <form action="salaryworker" method="post">
            Date: <input type="month" name="monthyear" value="${selectedDate}" required>
            <input type="submit" value="List">
        </form>
        <c:if test="${not empty reports}">
            <table>
            <tr>
                <th>Employee Name</th>
                <c:forEach begin="1" end="${daysInMonth}" var="day">
                    <th>${day}</th>
                </c:forEach>
            </tr>
            <br>
            <c:forEach items="${reports}" var="report">
                <tr>
                    <td>${report.employeeName}</td>
                    <c:forEach begin="1" end="${daysInMonth}" var="day">
                        <td>${report.getStatus(day)}</td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
        </c:if>
    </body>
</html>