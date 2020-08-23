<%-- 
    Document   : new
    Created on : 18-Jul-2020, 08:52:11
    Author     : root
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <title><fmt:message key="viewMarathon.infoMessage"/></title>
        </fmt:bundle>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>

        <style>
            body{
                padding-bottom: 5%;
            }
            .container {
                background-color: #f2f2f2;
                padding: 5px 20px 15px 20px;
                border: 1px solid lightgrey;
                border-radius: 3px;
            }
        </style>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">
            <div class="container" style="margin-top: 3%;margin-bottom: 3%;">
                <h2><fmt:message key="viewMarathon.infoMessage"/></h2>
                <hr>

                <div class="form-group col-sm-6">
                    <label for="id"><fmt:message key="label.marathon.id"/> </label>
                    <input name="mm.id" value="${mm.id}" disabled="true" class="form-control"/>
                </div>
                <div class="form-group col-sm-6">
                    <label for="name"><fmt:message key="label.marathon.name"/> </label>
                    <input name="mm.name" value="${mm.name}" disabled="true" class="form-control"/>
                </div>
                <h4 style="margin-top:3%;margin-bottom: 2%;"><fmt:message key="label.marathon.showtimes"/></h4>
                <table class="table table-dark" id='table1'>
                    <thead>
                        <tr>
                            <th><fmt:message key="label.marathon.id"/></th>
                            <th><fmt:message key="label.dateTime"/></th>
                            <th><fmt:message key="label.movie"/></th>
                            <th><fmt:message key="label.Hall"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach
                            items="${mm.showtimes}"
                            var="showtime"
                            varStatus="loop">
                            <tr id="${showtime.id}">
                                <td>${showtime.id}</td>
                                <fmt:formatDate value="${showtime.dateTime}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                <td>${myDate}</td>
                                <td>${showtime.movie}</td>
                                <td>${showtime.hall}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div>

                </div>
            </fmt:bundle>

            <%@include file="/WEB-INF/pages/template/footer.jsp" %>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/popper.js/1.16.0/umd/popper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.js"></script>
    </body>
</html>