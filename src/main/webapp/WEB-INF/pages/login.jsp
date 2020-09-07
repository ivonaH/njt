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

        <style>
            body{
                margin: 0;
                padding: 0;
                font-family: sans-serif;
                /*                background: url(../img/pozadina.jpg) no-repeat;*/
                background-size: cover;
                margin-top: 8%;
            }
            .login-box{
                width: 280px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);

            }
            .error{
                color: crimson;
            }
        </style>
    </head>
    <body>

        <%@include file="/WEB-INF/pages/template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">



            <!--<div class="col-sm-3" style="position: fixed; top: 35%;left: 40%; ">-->
            <div class="login-box container ">
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
                    <form:form method="Post" modelAttribute="user"  action="${pageContext.request.contextPath}/login/user">
                        <div class="form-group col-sm-8">
                            <label for="username"><fmt:message key="label.username"></fmt:message></label>
                            <form:input path="username"/>
                        </div> 
                        <div class="error">
                            <form:errors path="username"></form:errors>
                            </div>
                            <div class="form-group col-sm-6">
                                <label for="password"><fmt:message key="label.password"></fmt:message></label>
                            <form:input type="password" path="password"/>
                        </div> 
                        <div class="error">
                            <form:errors path="password"></form:errors>
                            </div>
                            <div class="col-sm-6">
                                <input type="submit" value="<fmt:message key="button.login"></fmt:message>" class="btn btn-outline-dark " style="background-color:lightgreen;"/>
                            </div>
                    </form:form>
                </div>
            </div>
        </fmt:bundle>


        <%@include file="/WEB-INF/pages/template/footer.jsp" %>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/popper.js/1.16.0/umd/popper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.js"></script>

      
    </body>
</html>
