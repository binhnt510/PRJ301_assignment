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
            body {
                background-color: #f2f2f2;
                padding: 20px;
                min-height: 100vh;
            }
            .container {
                border: 2px solid #1c7eed;
                border-radius: 8px;
                padding: 20px;
                margin: 20px auto;
                max-width: 800px;
                background-color: #f9f9f9;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                font-family: Arial, sans-serif;
            }

            /* Tiêu đề */
            .container h2 {
                color: #333;
                font-size: 24px;
                margin-bottom: 15px;
                text-align: center;
            }

            /* Đoạn văn và nhãn nổi bật */
            .container p {
                font-size: 18px;
                margin: 8px 0;
            }

            .container .highlight {
                color: #e63946;
                font-weight: bold;
            }

            /* Bảng */
            .container table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .container table, .container th, .container td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: center;
            }

            .container th {
                background-color: #1c7eed;
                color: white;
                font-weight: bold;
            }

            .container td {
                background-color: #f9f9f9;
            }

            /* Ô nhập */
            .container input[type="number"] {
                width: 80px;
                padding: 5px;
                font-size: 16px;
                border-radius: 4px;
                border: 1px solid #ccc;
                text-align: center;
            }

            /* Nút gửi */
            .container input[type="submit"] {
                background-color: #85b0fd;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .container input[type="submit"]:hover {
                background-color: #1c7eed;
            }

            /* Thông báo */
            .message {
                color: green;
                margin-bottom: 20px;
                font-weight: bold;
                text-align: center;
            }

            /* Khoảng cách nút gửi */
            .submit-container {
                margin-top: 20px;
                text-align: center;
            }
        </style>


    </head>
    <body>
        <div class="container">
            <h2>Create Schedule for:</h2>
            <p>Plan Name: <span class="highlight">${planName}</span></p>
            <p>Start Date: <span class="highlight"><script>
                let date = '${start}';
                document.write(date.split('-').reverse().join('-'));
                    </script></span></p>
            <p>End Date: <span class="highlight"><script>
                let date1 = '${end}';
                document.write(date1.split('-').reverse().join('-'));
                    </script></span></p>
            <p>Department Name: <span class="highlight">${departmentName}</span></p>
            <p>Product Name: <span class="highlight">${productName}</span></p>
            <p>Quantity: <span class="highlight">${quantity}</span></p>
            <p>Estimate: <span class="highlight">${estimate}</span></p>


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
        </div>
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
