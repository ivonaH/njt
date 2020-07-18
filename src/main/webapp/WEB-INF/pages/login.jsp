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
        <div class="container col-sm-3" style="position: fixed; top: 35%;left: 40%; ">
            <h2>Login strana</h2>
            <div class="row" >  
                <c:if test="${not empty logoutMessage}">
                    <div class="alert alert-success" role="alert">
                        ${logoutMessage}
                    </div>
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMessage}
                    </div> 
                </c:if>

                </div>
                <div class="row">
                    <form method="Post"  action="${pageContext.request.contextPath}/login/user">
                    <div class="form-group col-sm-6">
                        <label for="username">Username:</label>
                        <input name="username"/>
                    </div> 
                    <div class="form-group col-sm-6">
                        <label for="password">Password:</label>
                        <input type="password" name="password"/>
                    </div> 
                    <div class="col-sm-6">
                        <input type="submit" value="Login" class="btn btn-outline-dark " style="background-color:lightgreen;"/>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>