<%-- 
    Document   : newjsp
    Created on : Oct 24, 2024, 3:19:24 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach items="${departments}" var="d">
            <h2>${d.id}</h2>
        </c:forEach>
        
        <h1>hello</h1>
    </body>
</html>
