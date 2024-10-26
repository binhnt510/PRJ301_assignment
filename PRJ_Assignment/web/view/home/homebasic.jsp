<%-- 
    Document   : homebasic
    Created on : Oct 20, 2024, 11:53:02 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FPT University Learning Materials</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
            }
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
            .content-wrapper {
                padding: 20px;
                display: flex;
                justify-content: center;
            }
            .features {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 75%; 
                list-style: none;
            }
            
            .features a{
                text-decoration: none;
                color: inherit;
            }
            .features h2 {
                color: #007bff;
                margin-bottom: 20px;
            }
            .features .feature-item {
                background-color: #fff3e0;
                padding: 10px;
                border-radius: 5px;
                margin-bottom: 10px;
                transition: background-color 0.3s;

            }

            .features .feature-item:hover {
                background-color: #ffe0b2;
                cursor: pointer;
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
        <div class="content-wrapper">
            <div class="features">
                <h2>Employee's features</h2>
                <form action="home" method="get">
                    
                        <c:forEach items="${requestScope.permissions}" var="p">
                            <li>
                                <a href="http://localhost:9999/ta.com${p.url}"><div class="feature-item">${p.featurename}</div></a>
                            </li>
                        </c:forEach>
                    
                </form>

            </div>
        </div>
    </body>
</html>
