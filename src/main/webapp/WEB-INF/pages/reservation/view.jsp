<%-- 
    Document   : new
    Created on : 12-Jul-2020, 16:51:44
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
            <title><fmt:message key="viewReservation.infoMessage"/></title>
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
            .error{
                color: crimson;
            }
        </style>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">
            <div class="container">
                <h2><fmt:message key="viewReservation.infoMessage"/></h2>
                <hr>
                <div>
                    ${message}
                </div>
                <div>
                    ${errorMessage}
                </div>
                <div>
                    <form:form modelAttribute="reservation" method="POST" action="${pageContext.request.contextPath}/reservation/edit" >
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="id"><fmt:message key="label.reservationId"/> </label>
                                    <div class="col-sm-10">
                                        <form:input path="id" readonly="true" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="showtime"><fmt:message key="label.showtimeId"/> </label>
                                    <div class="col-sm-10">
                                        <form:input path="showtime.id"  readonly="true" class="form-control"/>
                                    </div>
                                    <label for="showtime"><fmt:message key="label.dateTime"/> </label>
                                    <div class="col-sm-10">
                                <form:input path="showtime.dateTime" readonly="true"  class="form-control"/>

                                    </div>
                                    <label for="showtime"><fmt:message key="label.movie"/> </label>
                                    <div class="col-sm-10">
                                        <form:input path="showtime.movie.name" readonly="true"  class="form-control"/>
                                    </div>
                                    <label for="showtime"><fmt:message key="label.Hall"/> </label>
                                    <div class="col-sm-10">
                                        <form:input path="showtime.hall.name" readonly="true"  class="form-control"/>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="nameLastname"><fmt:message key="label.nameLastname"/> </label>
                                    <div class="col-sm-10">
                                        <form:input path="nameLastname"  readonly="true" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email"><fmt:message key="label.email"/> </label>
                                    <div class="col-sm-10">
                                        <form:input path="email" class="form-control"/>
                                    </div>
                                    <div class=" error"> 
                                        <form:errors path="email"></form:errors>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col">
                                    <h4><fmt:message key="label.user"/></h4>
                                <label for="user"><fmt:message key="label.user.id"/></label>
                                <div class="col-sm-10">
                                    <form:input path="user.id"  readonly="true" class="form-control"/>
                                </div>
                                <label for="user"><fmt:message key="label.user.username"/></label>
                                <div class="col-sm-10">
                                    <form:input path="user.username"  readonly="true" class="form-control"/>
                                </div>
                                <label for="user"><fmt:message key="label.user.firstname"/></label>
                                <div class="col-sm-10">
                                    <form:input path="user.firstname"  readonly="true" class="form-control"/>
                                </div>
                                <label for="user"><fmt:message key="label.user.lastname"/></label>
                                <div class="col-sm-10">
                                    <form:input path="user.lastname"  readonly="true" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6" >
                            <input type="submit" value="<fmt:message key="button.updateReservation"/>" class="btn btn-outline-dark " style="background-color:lightgreen;"/>
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
