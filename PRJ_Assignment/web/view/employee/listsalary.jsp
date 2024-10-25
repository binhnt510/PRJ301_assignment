<%-- 
    Document   : listsalary
    Created on : Oct 25, 2024, 12:37:27 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Employee Attendance Report</h1>
        <table>
            <tr>
                <th>Employee Name</th>  <!-- Thay đổi từ Employee ID sang Employee Name -->
                    <c:forEach begin="1" end="31" var="day">
                    <th>Day ${day}</th>
                    </c:forEach>
            </tr>
            <c:forEach items="${reports}" var="report">
                <tr>
                    <td>${report.employeeName}</td>  <!-- Thay đổi từ employeeID sang employeeName -->
                    <c:forEach begin="1" end="31" var="day">
                        <td>
                            <span class="status ${report.getStatus(day) == 'P' ? 'present' : 
                                                  report.getStatus(day) == 'A' ? 'absent' : ''}">
                                      ${report.getStatus(day)}
                                  </span>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
        </body>
    </body>
</html>
