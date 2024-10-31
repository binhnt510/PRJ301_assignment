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
        <title>Attendance Insert</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 20px;
                color: #333;
            }

            form {
                background-color: white;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                max-width: 90%;
                margin: 20px auto;
            }

            h1 {
                text-align: center;
                color: #2c3e50;
                font-size: 28px;
                margin-bottom: 30px;
                padding-bottom: 15px;
                border-bottom: 2px solid #eee;
            }

            /* Styling cho span trong h1 */
            h1 span {
                color: #e74c3c;
                font-weight: 600;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                background-color: white;
                border-radius: 8px;
                overflow: hidden;
            }
            table input {
                box-sizing: border-box;
            }
            th {
                background-color: #34495e;
                color: white;
                font-weight: 600;
                padding: 15px;
                text-align: left;
                font-size: 16px;
            }

            td {
                padding: 12px 15px;
                border-bottom: 1px solid #ddd;
                font-size: 15px;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f5f5f5;
                transition: background-color 0.3s ease;
            }

            /* Styling cho input fields */
            input[type="number"],
            input[type="text"] {
                width: 100%;
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 15px;
                transition: border-color 0.3s ease;
            }

            input[type="number"]:focus,
            input[type="text"]:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
            }

            /* Styling cho readonly inputs */
            input[readonly] {
                background-color: #f8f9fa;
                border: 1px solid #ddd;
                cursor: not-allowed;
            }

            /* Styling cho submit button */
            input[type="submit"] {
                background-color: #2ecc71;
                color: white;
                padding: 12px 25px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 600;
                margin-top: 20px;
                transition: background-color 0.3s ease;
                display: block;
                margin-left: auto;
                margin-right: auto;
            }

            input[type="submit"]:hover {
                background-color: #27ae60;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(46, 204, 113, 0.3);
            }
        </style>
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
                        <c:forEach items="${details}" var="d" varStatus="loop">
                            <tr>
                                <!-- Luôn giữ schEmpId cho mỗi hàng, không phụ thuộc vào việc gộp cột -->
                        <input type="hidden" name="schEmpId" value="${d.schEmpId}"/>

                        <c:choose>
                            <c:when test="${d.rowSpan > 0}">
                                <td rowspan="${d.rowSpan}">
                                    ${d.employeeId}
                                </td>
                                <td rowspan="${d.rowSpan}">${d.employeeName}</td>
                            </c:when>
                        </c:choose>
                        <td>${d.productName}</td>
                        <td>${d.orderedQuantity}</td>
                        <td>
                            <input type="number" name="actualQuantity" min="0"
                                   required/>
                        </td>
                        <c:choose>
                            <c:when test="${d.rowSpan > 0}">
                                <td rowspan="${d.rowSpan}">
                                    <!-- Chỉ nhập alpha một lần cho nhóm trùng -->
                                    <input type="number" step="0.1" name="alpha_${d.employeeId}" 
                                           min="0" required
                                           onchange="updateAlpha(this.value, '${d.employeeId}', ${d.rowSpan})"/>

                                    <!-- Hidden inputs để đồng bộ giá trị alpha cho các hàng trong nhóm -->
                                    <c:forEach begin="0" end="${d.rowSpan - 1}" varStatus="status">
                                        <input type="hidden" 
                                               name="alpha" 
                                               id="alpha_hidden_${d.employeeId}_${status.index}"
                                               value="${d.alpha}"/>
                                    </c:forEach>
                                </td>
                            </c:when>
                        </c:choose>
                        <td>
                            <textarea name="note" class="note-input" rows="1" oninput="autoResize(this)">${d.note}</textarea>
                        </td>
                        <td>
                            <input type="text" name="username" readonly 
                                   style="background-color: gainsboro" 
                                   value="${requestScope.account.username} "/>
                        </td>
                        </tr>
                    </c:forEach>
                    <input type="hidden" name="rowCount" value="${details.size()}"/>
                    </tbody>
                </table>
                <input id="submit" type="submit" onclick="sure()" value="Save Attendance"/>
            </form>
        </c:if>
        <script>
            function autoResize(textarea) {
                textarea.style.height = "auto";
                textarea.style.height = textarea.scrollHeight + "px";
            }

// Xử lý form trước khi submit
            document.querySelector('form').addEventListener('submit', function (event) {
                // Lấy tất cả các textarea với class "note-input"
                const noteInputs = document.querySelectorAll('.note-input');

                // Duyệt qua từng textarea và thay thế dấu xuống dòng bằng dấu cách
                noteInputs.forEach(input => {
                    input.value = input.value.replace(/\n/g, '');
                });
            });
            function updateAlpha(value, employeeId, rowSpan) {
                // Cập nhật tất cả các hidden input của alpha cho cùng một nhóm employee
                for (let i = 0; i < rowSpan; i++) {
                    document.getElementById(`alpha_hidden_${employeeId}_${i}`).value = value;
                }
            }
            function sure()
            {
                var result = confirm("Are you sure to submit?");
                if (result)
                {
                    document.getElementById("submit").submit();
                } else {
                    event.preventDefault(); // Ngăn không cho form submit khi chọn "Cancel"
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
