<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule Campaign</title>
        <script>
            function submitForm() {
                document.getElementById("deptForm").submit();
            }
        </script>
    </head>
    <body>
        <form id="deptForm" action="listschedulecampaign" method="GET">
            Department: 
            <select name="deptId" onchange="submitForm()">
                <option value="">Select Department</option>
                <c:forEach items="${depts}" var="d">
                    <option value="${d.id}" ${param.deptId eq d.id ? 'selected' : ''}>${d.name}</option>
                </c:forEach>
            </select>
        </form>

        <c:if test="${scheduals != null}">
            <table border="1">
                <tr>
                    <th>Plan Name</th>
                    <th>Date</th>
                    <th>Department Name</th>
                    <th>Shift</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${scheduals}" var="s">
                    <tr>
                        <td>${s.planName}</td>
                        <td>${s.date}</td>
                        <td>${s.departmentName}</td>
                        <td>${s.shift}</td>
                        <td>${s.productName}</td>
                        <td>${s.quantity}</td>
                        <td>
                            <a href="detailforworker?scId=${s.scID}&deptId=${deptId}&shift=${s.shift}">
                                Create SchedualEmployee
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>