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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
                                    <input readonly="true" class="form-control" value="${reservation.showtime.dateTime}"/>
                                    </div>
                                    <label for="showtime"><fmt:message key="label.movie"/> </label>
                                    <div class="col-sm-10">
                                    <input readonly="true" class="form-control" value="${reservation.showtime.movie.name}"/>
                                    </div>
                                    <label for="showtime"><fmt:message key="label.Hall"/> </label>
                                    <div class="col-sm-10">
                                    <input readonly="true" class="form-control" value="${reservation.showtime.hall}"/>
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
                                    <div> 
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

    </body>
</html>
