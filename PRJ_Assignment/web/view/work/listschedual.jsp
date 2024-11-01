<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule Campaign</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            .header {
                background-color: #1c7eed;
                color: white;
                padding: 10px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                position: relative;
            }
            .home-btn {
                display: flex;
                align-items: center;
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
            }
            .home-btn i {
                margin-right: 5px;
            }
            .home-btn:hover {
                background-color: #45a049;
            }
            .title {
                font-size: 24px;
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
                text-align: center;

            }
            .title img{
                border-radius: 10px;
                width: 80px;
                height: 35px;
                margin-bottom: 5px;
            }
            .right-controls p{
                color: orange;
                margin: 0;
                margin-right: 5px;
            }
            .right-controls {
                display: flex;
                align-items: center;
            }
            .right-controls ul{
                list-style: none;
            }
            .right-controls li{
                display: flex;
                text-align: center;
            }

            .profile-icon img {

                padding: 10px;
                border-radius: 50%;
                text-align: center;
                width: 45px;
                height: 45px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 18px;
            }
            .logout {
                background-color: #e14d4d;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
            }
            .logout:hover {
                background-color: #ff0000;
            }
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                
            }

            /* Department selection styling */
            .selectdept {
                margin: 20px 0;
                padding: 15px;
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .infor{
                padding: 20px;
            }
            .selectdept form {
                display: flex;
                align-items: center;
                gap: 10px;
                justify-content: center;
                font-size: 20px;
            }
            
            .selectdept select {
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                min-width: 200px;
                background-color: white;
                cursor: pointer;
                transition: border-color 0.3s ease;
            }

            .selectdept select:hover {
                border-color: #999;
            }

            .selectdept select:focus {
                outline: none;
                border-color: #4a90e2;
                box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
            }

            /* Table styling */
            .show {
                margin-top: 20px;
                overflow-x: auto;
            }

            .show table {
                width: 100%;
                border-collapse: collapse;
                background: white;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            .show table th,
            .show table td {
                padding: 12px 15px;
                text-align: left;
                border: 1px solid #eee;
            }

            .show table th {
                background-color: #f8f9fa;
                color: #333;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 14px;
            }

            .show table tr:hover {
                background-color: #f8f9fa;
            }

            /* Action link styling */
            .show table a {
                display: inline-block;
                padding: 6px 12px;
                background-color: #4a90e2;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                font-size: 14px;
                transition: background-color 0.3s ease;
            }

            .show table a:hover {
                background-color: #357abd;
            }
        </style>

    </head>
    <body>
        <div class="header">
            <a href="http://localhost:9999/ta.com/home" class="home-btn"><i class="fas fa-home"></i> Home</a>
            <div class="title">
                <img src="http://localhost:9999/ta.com/img/logo123.jpg">
                <div >Công ty thủ công mỹ nghệ Thế Anh</div>
            </div>
            <div class="right-controls">
                <ul>
                    <li><p>Username: </p> ${sessionScope.account.username}</li>
                    <li> ${sessionScope.account.displayname}</li>
                </ul>
                <div class="profile-icon"><img src="http://localhost:9999/ta.com/img/abstract-user-flat-4.png"></div>
                <a class="logout" href="http://localhost:9999/ta.com/logout"><i class="fas fa-sign-out-alt"></i></a>
            </div>
        </div>
                <div class="infor">
            <div class="selectdept">
                <h2 style="color: red; text-align: center;">Please choose the correct workshop that you manage</h2> 
                <form id="deptForm" action="listschedulecampaign" method="GET">
                    Department: 
                    <select name="deptId" onchange="submitForm()">
                        <option value="">Select Department</option>
                        <c:forEach items="${depts}" var="d">
                            <option value="${d.id}" ${param.deptId eq d.id ? 'selected' : ''}>${d.name}</option>
                        </c:forEach>
                    </select>
                </form>
            </div>
            <div class="show">        
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
            </div>
        </div>
        <script>
            function submitForm() {
                document.getElementById("deptForm").submit();
            }
        </script>
    </body>
</html>