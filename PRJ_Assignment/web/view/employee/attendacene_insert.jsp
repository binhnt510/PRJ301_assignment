<%-- 
    Document   : attendacene_insert
    Created on : Oct 24, 2024, 1:24:32 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:if test="${not empty details}">
        <form action="attendance" method="post">
            <input type="hidden" name="action" value="save"/>
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
                            <input type="number" name="actualQuantity"  min="0"
                                   value="${d.actualQuantity}" required/>
                        </td>
                        <td>
                            <input type="number" step="0.1" name="alpha"  min="0"
                                   value="${d.alpha}" required/>
                        </td>
                        <td>
                            <input type="text" name="note" value="${d.note}"/>
                        </td>
                        <td> <input type="text" name="username"  readonly style="background-color: gainsboro" value="${requestScope.account.username} "/> </td>
                    </tr>
                </c:forEach>
                <input type="hidden" name="rowCount" value="${details.size()}"/>
                </tbody>
            </table>
                <input id="submit" type="submit" onclick="sure()" value="Save Attendance"/>
        </form>
    </c:if>
    <script>
        function sure()
            {
                var result = confirm("Are you sure to submit?");
                if(result)
                {
                    document.getElementById("submit").submit();
                }
            }
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
