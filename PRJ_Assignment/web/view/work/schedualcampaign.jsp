<%-- 
    Document   : schedualcampaign
    Created on : Oct 27, 2024, 11:00:03 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h2>Create Schedule for:</h2>
        <p>Plan Name: <span style="color: red">${planName}</span></p>
        <p>Start Date: <span style="color: red"><script>
            let date = '${start}';
            document.write(date.split('-').reverse().join('-'));
                </script></span></p>
        <p>End Date: <span style="color: red"><script>
            let date1 = '${end}';
            document.write(date1.split('-').reverse().join('-'));
                </script></span></p>
        <p>Department Name: <span style="color: red">${departmentName}</span></p>
        <p>Product Name: <span style="color: red">${productName}</span></p>
        <p>Quantity:  <span style="color: red">${quantity}</span></p>
        <p>Estimate: <span style="color: red">${estimate}</span></p>

        <!-- Đặt đoạn script ở đây -->
        <script>
            requiredQuantity = parseInt('${quantity}', 10);
        </script>


        <c:if test="${not empty message}">
            <div style="color: green; margin-bottom: 20px;">
                ${message}
            </div>
        </c:if>

        <c:if test="${empty message}">
            <form action="schedulecampain" method="POST" onsubmit="return validateForm()">
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
                            <td><input type="number" name="k1" min="0" required></td>
                            <td><input type="number" name="k2" min="0" required></td>
                            <td><input type="number" name="k3" min="0" required></td>
                        </tr>
                    </c:forEach>
                </table>
                <div style="margin-top: 20px;">
                    <input type="submit" value="Save">
                </div>
            </form>
        </c:if>
        <script>
            // Khai báo biến toàn cục
            var requiredQuantity;

            function validateForm() {
                let total = 0;
                const k1Inputs = document.getElementsByName('k1');
                const k2Inputs = document.getElementsByName('k2');
                const k3Inputs = document.getElementsByName('k3');

                for (let i = 0; i < k1Inputs.length; i++) {
                    total += parseInt(k1Inputs[i].value || 0, 10);
                    total += parseInt(k2Inputs[i].value || 0, 10);
                    total += parseInt(k3Inputs[i].value || 0, 10);
                }

                if (total !== requiredQuantity) {
                    alert('Tổng số phải bằng ' + requiredQuantity + '. Hiện tại tổng là ' + total + '.');
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
