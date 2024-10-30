<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Schedule Employee</title>
        <script>
            function validateForm() {
                var checkboxes = document.getElementsByName('employeeIds');
                var quantities = document.getElementsByName('quantities');
                var total = 0;
                var required = parseInt(document.getElementById('requiredQuantity').value);
                
                for(var i = 0; i < checkboxes.length; i++) {
                    if(checkboxes[i].checked) {
                        var q = quantities[i].value;
                        if(q === '') {
                            alert('Please enter quantity for selected employees');
                            return false;
                        }
                        total += parseInt(q);
                    }
                }
                
                if(total !== required) {
                    alert('Total quantity must match required quantity: ' + required);
                    return false;
                }
                return true;
            }
            
            function toggleAll(source) {
                var checkboxes = document.getElementsByName('employeeIds');
                for(var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = source.checked;
                }
            }
        </script>
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
            </div>
        </c:if>
        <c:if test="${empty message}">
        <h3>Employee Assignment</h3>
        <form action="detailforworker" method="POST" onsubmit="return validateForm()">
            <input type="hidden" name="scId" value="${schedule.scID}" />
            <input type="hidden" id="requiredQuantity" name="requiredQuantity" value="${schedule.quantity}" />
            
            <table border="1">
                <tr>
                    <th><input type="checkbox" onclick="toggleAll(this)" /> Tick All</th>
                    <th>Employee Name</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                </tr>
                <c:forEach items="${employees}" var="e">
                    <tr>
                        <td><input type="checkbox" name="employeeIds" value="${e.id}" /></td>
                        <td>${e.name}</td>
                        <td>${schedule.productName}</td>
                        <td><input type="number" name="quantities" min="0" /></td>
                    </tr>
                </c:forEach>
            </table>
            <input type="submit" value="Save" />
        </form>
        </c:if>
    </body>
</html>