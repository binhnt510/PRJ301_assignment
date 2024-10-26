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
        <form action="attendance" method="post">
            <input type="hidden" name="action" value="search"/>
            <table>
                <tr>
                    <td>Date:</td>
                    <td><input type="date" name="date" required value="${searchDate}"/></td>
                </tr>
                <tr>
                    <td>Department:</td>
                    <td>
                        
                        <select name="departmentId">
                            <c:forEach items="${requestScope.depts}" var="d">
                                <option value="${d.id}">${d.name}</option>
                            </c:forEach>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td>Shift:</td>
                    <td>
                        <select name="shift">
                                <option value="K1">K1</option>
                                <option value="K2">K2</option>
                                <option value="K3">K3</option>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Search for inserting the attendance of workers" name="search1"/>
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <input type="submit" value="Check the saved attendance of workers"" name="check" />
                    </td>
                </tr>
            </table>
        </form>

        <!-- Form 2: Attendance Details -->
        <c:if test="${not empty details}">
            <form action="attendance" method="post">
                <input type="hidden" name="action" value="check"/>
            <h1>Attendance at <span style="color: red"> ${requestScope.depname}</span> -- <span style="color: red" id="dateDisplay">${searchDate}</span> -- Production shift: <span style="color: red">${searchShift}</span> </h1>
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
                            <th>Createby</th>
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
                            ${d.actualQuantity}
                        </td>
                        <td>
                            ${d.alpha}
                        </td>
                        <td>
                            ${d.note}
                        </td>
                        <td> ${d.createBy}</td>
                    </tr>                        
                     </c:forEach>
                    
                    </tbody>
                </table>
            </form>
        </c:if>
        <h1 style="color: red">${report}</h1>
        <script>
    // Ví dụ biến searchDate có giá trị yyyy-mm-dd
    var searchDate = "${searchDate}";

    // Hàm để chuyển đổi sang dd-mm-yyyy
    function formatDate(dateString) {
        var dateParts = dateString.split("-");
        return dateParts[2] + "/" + dateParts[1] + "/" + dateParts[0];
    }

    // Chuyển đổi và hiển thị trong thẻ h1
    document.getElementById('dateDisplay').innerHTML = formatDate(searchDate);
</script>
    </body>
</html>

