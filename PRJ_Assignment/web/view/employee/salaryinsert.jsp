<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            .button-container {
                margin-top: 20px;
            }
            .button-container form {
                display: inline-block;
                margin-right: 10px;
            }
            .salary-column {
                text-align: right; /* Căn phải cho cột số tiền */
            }
        </style>
    </head>
    <body>
        <form action="salaryworker" method="post">
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
                <table>
                    <tr>
                        <th>Employee Name</th>
                            <c:forEach begin="1" end="${daysInMonth}" var="day">
                            <th>${day}</th>
                            </c:forEach>
                        <th>Salary</th>
                    </tr>
                    <c:forEach items="${reports}" var="report">
                        <tr>
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

                <div class="button-container">
                    <form action="salaryworker" method="post" style="display: inline;">
                        <input type="hidden" name="monthyear" value="${selectedDate}">
                        <input type="hidden" name="action" value="calculate">
                        <input type="submit" value="Calculate Salaries">
                    </form>

                    <form action="salaryworker" method="post" style="display: inline;">
                        <input type="hidden" name="monthyear" value="${selectedDate}">
                        <input type="hidden" name="action" value="save">
                        <input type="submit" value="Save Salaries">
                    </form>
                </div>
            </c:if>
        </c:if>
    </body>
</html>