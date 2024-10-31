<%-- 
    Document   : attendance_report_exist
    Created on : Oct 25, 2024, 3:39:57 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
        <style>
            body {
                display: flex;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
                text-align: center;
                justify-content: center;
            }
            .recorded{
                margin-top: 20px;
                width: 80vw;
                border-radius: 30px;
                background-color: white;
                border: 2px solid;
                padding: 20px;
                
            }
        </style>
    </head>
    <body>
        <div class="recorded">
        <h1>Attendance has been recorded </h1>
        <a href="attendance" ><button style="font-size: 20px">Back</button></a>
        </div>
    </body>
</html>
