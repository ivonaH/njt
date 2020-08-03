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
            <title><fmt:message key="viewShowtime.infoMessage"/></title>
        </fmt:bundle>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>

    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">
            <div class="container">
                <h2><fmt:message key="viewShowtime.infoMessage"/></h2>
                <hr>
                <div>
                    <form:form modelAttribute="showtime" method="POST" action="${pageContext.request.contextPath}/showtime/update" >

                        <div class="form-group">
                            <label for="id"><fmt:message key="label.showtimeId"/></label>
                            <div class="col-sm-1">
                                <form:input path="id" readonly="true" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="movie"><fmt:message key="label.movie"/> </label>
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="id"><fmt:message key="label.movieId"/></label>
                                    <div class="col-sm-2">
                                        <form:input path="movie.id"  readonly="true" class="form-control"/>                                   
                                    </div>
                                    <label for="name"><fmt:message key="label.movieName"/></label>
                                    <div class="col-sm-2">
                                        <form:input path="movie.name"  readonly="true" class="form-control"/>
                                    </div>
                                    <label for="genre"><fmt:message key="label.movieGenre"/></label>
                                    <div class="col-sm-3">
                                        <form:input path="movie.genre"  readonly="true" class="form-control "/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="year"><fmt:message key="label.year"/></label>
                                    <div class="col-sm-2">
                                        <form:input path="movie.year"  readonly="true" class="form-control "/>
                                    </div>
                                    <label for="director"><fmt:message key="label.director"/></label>
                                    <div class="col-sm-4">
                                    <form:input path="movie.director"  readonly="true" class="form-control"/>
                                    </div>
                                    <label for="duration"><fmt:message key="label.duration"/></label>
                                    <div class="col-sm-2">
                                        <form:input path="movie.duration"  readonly="true" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="hall"><fmt:message key="label.Hall"/> </label>
                            <div class="col-sm-4">
                                <form:select path="hall" class="custom-select">
                                    <option selected disabled><fmt:message key="option.hall"/></option>
                                    <form:options items="${halls}" itemLabel="name" itemValue="id" ></form:options>
                                </form:select>

                            </div>
                            <div>
                                <form:errors path="hall"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dateTime"><fmt:message key="label.dateTime"/></label>
                            <div class="col-sm-4">
                                <form:input path="dateTime"  readonly="true" class="form-control"/>
                            </div>


                        </div>
                        <h4><fmt:message key="label.user"/></h4>
                        <div class="form-group row">
                            <label for="user"><fmt:message key="label.user.id"/></label>
                            <div class="col-sm-2">
                                <form:input path="user.id"  readonly="true" class="form-control"/>
                            </div>
                            <label for="user"><fmt:message key="label.user.username"/></label>
                            <div class="col-sm-2">
                                <form:input path="user.username"  readonly="true" class="form-control"/>
                            </div>
                            <label for="user"><fmt:message key="label.user.firstname"/></label>
                            <div class="col-sm-2">
                                <form:input path="user.firstname"  readonly="true" class="form-control"/>
                            </div>
                            <label for="user"><fmt:message key="label.user.lastname"/></label>
                            <div class="col-sm-2">
                                <form:input path="user.lastname"  readonly="true" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="marathonId"><fmt:message key="label.marathon.id"/></label>
                            <div class="col-sm-1">
                                <form:input path="movieMarathonId" class="form-control" readonly="true"/>
                            </div>
                        </div>
                        <div class="col-sm-4" >
                            <input type="submit" value="<fmt:message key="button.showtime.update"/>" class="btn btn-outline-dark " style="background-color:lightgreen;"/>
                        </div>
                    </form:form>
                </div>
            </div>
        </fmt:bundle>

    </body>
</html>
