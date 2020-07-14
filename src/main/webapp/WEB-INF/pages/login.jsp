<%-- 
    Document   : login
    Created on : 12-Jul-2020, 13:34:27
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>
        <link href='${pageContext.request.contextPath}/resources/css/styles.css' rel="stylesheet"/>
    </head>
    <body>
        <div class="container">
            <h2>Login strana</h2>
            <div class="row">     
                ${logoutMessage}
                ${errorMessage}
            </div>
            <div class="row">
                <form method="Post"  action="${pageContext.request.contextPath}/login/user">
                    <div>
                        <label for="username">Username:</label>
                        <input name="username"/>
                    </div> 
                    <div>
                        <label for="password">Password:</label>
                        <input type="password" name="password"/>
                    </div> 
                    <input type="submit" value="Login" />
                </form>
            </div>
        </div>
    </body>
</html>
