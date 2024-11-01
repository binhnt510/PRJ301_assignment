<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Schedule Employee</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f5f5f5;
                padding: 20px;
                max-width: 1200px;
                margin: 0 auto;
            }

            h3 {
                color: #2c3e50;
                margin: 25px 0 15px 0;
                padding-bottom: 10px;
                border-bottom: 2px solid #3498db;
            }

            /* Schedule Information Table */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 25px;
                background: white;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }

            table th, table td {
                padding: 12px 15px;
                text-align: left;
                border: 1px solid #eee;
            }

            table th {
                background-color: #f8f9fa;
                color: #2c3e50;
                font-weight: 600;
                width: 200px;
            }

            /* Success Message Styling */
            div[style*="color: green"] {
                background-color: #d4edda;
                border: 1px solid #c3e6cb;
                color: #155724 !important;
                padding: 15px;
                border-radius: 4px;
                margin: 20px 0;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            /* Back Button Styling */
            button {
                background-color: #3498db;
                color: white;
                border: none;
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px !important;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #2980b9;
            }

            /* Employee Assignment Form */
            form {
                margin-top: 20px;
            }

            /* Checkbox styling */
            input[type="checkbox"] {
                width: 18px;
                height: 18px;
                cursor: pointer;
            }

            /* Number input styling */
            input[type="number"] {
                width: 80px;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
            }

            input[type="number"]:focus {
                outline: none;
                border-color: #3498db;
                box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
            }

            /* Submit button styling */
            input[type="submit"] {
                background-color: #27ae60;
                color: white;
                padding: 12px 24px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                margin-top: 20px;
                transition: background-color 0.3s ease;
            }
            a.back {
                background-color: #2980b9; /* Màu của thẻ a */
                color: white;
                padding: 12px 24px;
                border-radius: 4px;
                text-decoration: none; /* Bỏ gạch chân */
                font-size: 16px;
                height: 19px;
                margin-left: 40px;
                transform: translate(0px, 2.5px);
                display: inline-block;
                transition: background-color 0.3s ease;
            }

            a.back:hover {
                background-color: #1f639a; /* Màu khi hover */
            }

            input[type="submit"]:hover {
                background-color: #219a52;
            }

            /* Employee Assignment Table specific styles */
            table tr:hover {
                background-color: #f8f9fa;
            }

            /* First table - Schedule Information */
            table:first-of-type th {
                background-color: #f1f8ff;
            }

            /* Second table - Employee Assignment */
            table:last-of-type th {
                background-color: #f8f9fa;
                text-align: center;
            }

            table:last-of-type td {
                text-align: center;
            }
        </style>

    </head>
    <body>
        <h3>Schedule Information</h3>
        <table border="1">
            <tr>
                <th>Plan Name</th>
                <td>${schedule.planName}</td>
            </tr>
            <tr>
                <th>Date</th>
                <td>${schedule.date}</td>
            </tr>
            <tr>
                <th>Department</th>
                <td>${schedule.departmentName}</td>
            </tr>
            <tr>
                <th>Shift</th>
                <td>${schedule.shift}</td>
            </tr>
            <tr>
                <th>Product</th>
                <td>${schedule.productName}</td>
            </tr>
            <tr>
                <th>Required Quantity</th>
                <td>${schedule.quantity}</td>
            </tr>
        </table>
        <c:if test="${not empty message}">
            <div style="color: green; margin-bottom: 20px;">
                ${message}
                <a href="javascript:window.history.back();" ><button style="font-size: 30px">Back</button></a>
            </div>
        </c:if>
        <c:if test="${empty message}">
            <h3>Employee Assignment</h3>
            <form action="detailforworker" method="POST" onsubmit="return validateForm()">
                <input type="hidden" name="scId" value="${schedule.scID}" />
                <input type="hidden" id="requiredQuantity" name="requiredQuantity" value="${schedule.quantity}" />

                <table border="1">
                    <tr>
                        <th><input type="checkbox" onclick="toggleAll(this)" /></th>
                        <th>Employee Name</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                    </tr>
                    <c:forEach items="${employees}" var="e">
                        <tr>
                            <td><input type="checkbox" name="employeeIds" value="${e.id}" /></td>
                            <td>${e.name}</td>
                            <td>${schedule.productName}</td>
                            <td><input type="number" name="quantities" min="0"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <input type="submit" value="Save" />
                <a href="javascript:window.history.back();" class="back">Back</a>
            </form>
        </c:if>
        <script>
            function validateForm() {
                var checkboxes = document.getElementsByName('employeeIds');
                var quantities = document.getElementsByName('quantities');
                var total = 0;
                var required = parseInt(document.getElementById('requiredQuantity').value);
                var hasChecked = false;

                // Tính tổng quantity của các employee được chọn
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        hasChecked = true;
                        var q = quantities[i].value;
                        if (q === '') {
                            alert('Please enter quantity for selected employees');
                            quantities[i].focus();
                            return false;
                        }
                        total += parseInt(q);
                    }
                }

                // Kiểm tra nếu chưa chọn employee nào
                if (!hasChecked) {
                    alert('Please select at least one employee.');
                    return false;
                }

                // Kiểm tra tổng quantity có bằng required không
                if (total !== required) {
                    alert('The total must equal ' + required + '. Currently, the total is ' + total);
                    return false;
                }
                return true;
            }

            function toggleAll(source) {
                var checkboxes = document.getElementsByName('employeeIds');
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = source.checked;
                }
            }

        </script>
    </body>
</html>