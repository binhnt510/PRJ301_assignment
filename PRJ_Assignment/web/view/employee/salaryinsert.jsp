<%-- 
    Document   : salaryinsert
    Created on : Oct 24, 2024, 7:58:34 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Employee Salaries</h1>
        <table border="1">
            <tr>
                <th>Employee Name</th>
                    <c:forEach var="day" begin="1" end="31">
                    <th>Salary Day ${day}</th>
                    </c:forEach>


            </tr>
            <c:forEach var="emp" items="${salaries}">
                <tr>
                    <td>${emp.employeeName}</td>
                    <td>${emp.salary[0]}</td>
                    <td>${emp.salary[1]}</td>
                    <td>${emp.salary[2]}</td>
                    <td>${emp.salary[3]}</td>
                    <td>${emp.salary[4]}</td>
                    <td>${emp.salary[5]}</td>
                    <td>${emp.salary[30]}</td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
