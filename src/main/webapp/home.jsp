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

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </head>
    <body>

        <%@include file="/WEB-INF/pages/template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">

        <c:if test="${empty sessionScope.user}">

            <div class="container" style="padding-top: 15%; padding-left: 17%;">

                <h2><fmt:message key="label.welcome"/></h2>
                <br>
                <h3>
                    <fmt:message key="label.continue"/>
                    <a href="${pageContext.request.contextPath}/login" style="color: lightgreen;font-size: 30px;"><b><fmt:message key="label.loginTxt"/></b>!</a>
                </h3>
            </div>

        </c:if>
</fmt:bundle>
    </body>
</html>
