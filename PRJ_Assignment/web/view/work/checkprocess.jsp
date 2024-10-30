<%-- 
    Document   : searchplan
    Created on : Oct 26, 2024, 11:56:04 AM
    Author     : admin
--%>

<!-- view/work/searchplan.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Plan</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .search-form {
                margin-bottom: 20px;
            }
            .status-ongoing {
                color: blue;
            }
            .status-late {
                color: red;
            }
            .status-complete {
                color: green;
            }
        </style>
    </head>
    <body>
        <div class="search-form">
            <form action="checkprocess" method="POST">
                <label for="planName">Plan Name:</label>
                <select name="planName" required id="planName" >
                    <c:forEach items="${requestScope.planName}" var="p">
                        <option value="${p.name}">${p.name}</option>
                    </c:forEach>
                </select>
    <!--                <input type="text" id="planName" name="planName" value="${planName}" required/>-->
                <input type="submit" value="Search"/>
            </form>



        </div>

        <c:if test="${not empty details}">
            <table>
                <thead>
                    <tr>
                        <th>Plan ID</th>
                        <th>Plan Name</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Department Name</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Estimate</th>
                        <th>Quantity Accomplished</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${details}" var="d">
                        <tr>
                            <td>${d.planId}</td>
                            <td>${d.planName}</td>
                            <td> <fmt:formatDate value="${d.startDate}" pattern="dd-MM-yyyy" /></td>
                            <td> <fmt:formatDate value="${d.endDate}" pattern="dd-MM-yyyy" /></td>
                            <td>${d.departmentName}</td>
                            <td>${d.productName}</td>
                            <td>${d.quantity}</td>
                            <td>${d.estimate}</td>
                            <td>${d.accomplishedQuantity}</td>
                            <td class="status-${d.status.replace(' ', '')}">${d.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
