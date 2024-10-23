<%-- 
    Document   : listplan
    Created on : Oct 23, 2024, 12:19:26 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List plan</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>PlanName</th>
                <th>StartDate</th>
                <th>EndDate</th>
                <th>DepartmentName</th>
                <th>ProductName</th>
                <th>Quantity</th>
                <th>Estimate</th>
            </tr>
            <c:forEach  items="${requestScope.pc}" var="p">
                <tr>
                    <td>${p.plans.planname}</td>
                    <td>${p.plans.start}</td>
                    <td>${p.plans.end}</td>
                    <td>${p.plans.dp.name}</td>
                    <td>${p.pr.name}</td>
                    <td>${p.quantity}</td>
                    <td>${p.cost}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
