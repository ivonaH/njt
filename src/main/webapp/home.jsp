<%-- 
    Document   : home
    Created on : 15-Jul-2020, 11:41:18
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <title><fmt:message key="link.HomePage"/></title>
        </fmt:bundle>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>


        <style>
            body{
                margin: 0;
                padding: 0;
                font-family: sans-serif;
                /*background: url(../img/pozadina.jpg) no-repeat;*/
                background-size: cover;
            }
            .login-box{
                width: 500px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);

            }
        </style>
    </head>
    <body>

        <%@include file="/WEB-INF/pages/template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">
            <div class="container"  style='margin-top:8%;'>

            <c:if test="${empty sessionScope.user}">

                <div class="login-box container ">

                    <h2><fmt:message key="label.welcome"/></h2>
                    <br>
                    <h3>
                        <fmt:message key="label.continue"/>
                        <a href="${pageContext.request.contextPath}/login" style="color: lightgreen;font-size: 30px;"><b><fmt:message key="label.loginTxt"/></b></a>
                    </h3>
                </div>

            </c:if>
        </fmt:bundle>

        <%@include file="/WEB-INF/pages/template/footer.jsp" %>
      
        </script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/popper.js/1.16.0/umd/popper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.js"></script>
         <script type="text/javascript">
            
       </div>
    </body>
</html>
