<%-- 
    Document   : login
    Created on : 12-Jul-2020, 13:34:27
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <title><fmt:message key="login.infoMessage"/></title>
        </fmt:bundle>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>
        <link href='${pageContext.request.contextPath}/resources/css/styles.css' rel="stylesheet"/>
    </head>
    <body>

        <fmt:bundle basename="i18n/config">


            <nav class="navbar navbar-expand-sm justify-content-end" style="background-color:lightgreen;">
                <div class="collapse navbar-collapse flex-grow-0" id="navbarSupportedContent">
                    <ul class="navbar-nav text-right">
                        <li class="nav-item active">
                            <a  class="nav-link active green" href="?sessionLocale=en_US">en_US</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link active green" href="?sessionLocale=sr_RS">sr_RS</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="container col-sm-3" style="position: fixed; top: 35%;left: 40%; ">

                <h2><fmt:message key="login.infoMessage"/></h2>
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
                            <label for="username"><fmt:message key="label.username"></fmt:message></label>
                                <input name="username"/>
                            </div> 
                            <div class="form-group col-sm-6">
                                <label for="password"><fmt:message key="label.password"></fmt:message></label>
                                <input type="password" name="password"/>
                            </div> 
                            <div class="col-sm-6">
                                <input type="submit" value="<fmt:message key="button.login"></fmt:message>" class="btn btn-outline-dark " style="background-color:lightgreen;"/>
                            </div>
                        </form>
                    </div>
                </div>
        </fmt:bundle>
    </body>
</html>
