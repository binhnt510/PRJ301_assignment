<%-- 
    Document   : listplan
    Created on : Oct 27, 2024, 10:59:28 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Plan List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Plan List</h2>
    <table>
        <tr>
            <th>Plan ID</th>
            <th>Plan Name</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Department</th>
            <th>Product</th>
            <th>Quantity</th>
            <th>Estimate</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${plans}" var="plan">
            <tr>
                <td>${plan.planId}</td>
                <td>${plan.planName}</td>
                <td><fmt:formatDate value="${plan.startDate}" pattern="dd-MM-yyyy" /></td>
                <td><fmt:formatDate value="${plan.endDate}" pattern="dd-MM-yyyy" /></td>
                <td>${plan.departmentName}</td>
                <td>${plan.productName}</td>
                <td>${plan.quantity}</td>
                <td>${plan.estimate}</td>
                <td>
                    <c:choose>
                        <c:when test="${empty plan.status}">
                            <a href="schedulecampain?planCampnID=${plan.planCampnID}&planName=${plan.planName}&startDate=${plan.startDate}&endDate=${plan.endDate}&departmentName=${plan.departmentName}&productName=${plan.productName}&quantity=${plan.quantity}&estimate=${plan.estimate}">Create plan for SchedualCampaign</a>
                        </c:when>
                        <c:otherwise>
                            Plan has created for SchedualCampaign
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>

