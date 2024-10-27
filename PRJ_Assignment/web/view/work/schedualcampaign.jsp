<%-- 
    Document   : schedualcampaign
    Created on : Oct 27, 2024, 11:00:03 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Schedule Form</title>
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
        input[type="number"] {
            width: 80px;
        }
    </style>
</head>
<body>
    <h2>Create Schedule</h2>
    
    <c:if test="${not empty message}">
        <div style="color: green; margin-bottom: 20px;">
            ${message}
        </div>
    </c:if>
    
    <c:if test="${empty message}">
        <form action="schedualcampaigns" method="POST">
            <input type="hidden" name="planCampnID" value="${planCampnID}">
            <table>
                <tr>
                    <th>Date</th>
                    <th>K1</th>
                    <th>K2</th>
                    <th>K3</th>
                </tr>
                <c:forEach var="date" items="${dates}">
                    <tr>
                        <td>
<c:set var="formattedDate" value="${fn:substring(date, 8, 10)}-${fn:substring(date, 5, 7)}-${fn:substring(date, 0, 4)}" />
                            ${formattedDate}
                            <input type="hidden" name="date" value="${date}">
                        </td>
                        <td><input type="number" name="k1" min="0" required=""></td>
                        <td><input type="number" name="k2" min="0" required=""></td>
                        <td><input type="number" name="k3" min="0" required=""></td>
                    </tr>
                </c:forEach>
            </table>
            <div style="margin-top: 20px;">
                <input type="submit" value="Save">
            </div>
        </form>
    </c:if>
</body>
</html>
