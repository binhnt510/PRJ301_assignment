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
        <title>Attendance Management</title>
    </head>
    <body>
        <h1>Attendance Management</h1>
        <!-- Form 1: Search Form -->
        <form action="attendance" method="POST">
            <input type="hidden" name="action" value="search"/>
            <table>
                <tr>
                    <td>Date:</td>
                    <td><input type="date" name="date" required value="${searchDate}"/></td>
                </tr>
                <tr>
                    <td>Department:</td>
                    <td>
                        <input type="number" name="departmentId" required value="${searchDepartment}"/>
                    </td>
                </tr>
                <tr>
                    <td>Shift:</td>
                    <td>
                        <input type="text" name="shift" required value="${searchShift}"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Search"/>
                    </td>
                </tr>
            </table>
        </form>
                       
        <!-- Form 2: Attendance Details -->
        <c:if test="${not empty details}">
            <form action="attendance" method="POST">
                <input type="hidden" name="action" value="save"/>
                 <h1>Attendance at workshop No. <p>1 </p><p>${searchDate}</p> Production shift: <p>${searchShift}</p> </h1>
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
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${details}" var="d">
                            <tr>
                                <td>
                                    ${d.employeeId}
                                    
                                    <input type="hidden" name="schEmpId" value="${d.schEmpId}"/>
                                </td>
                                <td>${d.employeeName}</td>
                                <td>${d.productName}</td>
                                <td>${d.orderedQuantity}</td>
                                <td>
                                    <input type="number" name="actualQuantity" 
                                           value="${d.actualQuantity}" required/>
                                </td>
                                <td>
                                    <input type="number" step="0.1" name="alpha" 
                                           value="${d.alpha}" required/>
                                </td>
                                <td>
                                    <input type="text" name="note" value="${d.note}"/>
                                </td>
                            </tr>
                        </c:forEach>
                            <input type="hidden" name="rowCount" value="${details.size()}"/>
                    </tbody>
                </table>
                <input type="submit" value="Save Attendance"/>
            </form>
        </c:if>
    </body>
</html>
        
