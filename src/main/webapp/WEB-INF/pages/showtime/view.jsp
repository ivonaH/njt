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
                <h2><fmt:message key="viewShowtime.infoMessage"/></h2>
                <hr>
                <div>
                    <form:form modelAttribute="showtime" method="POST" action="${pageContext.request.contextPath}/showtime/update" >
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label for="id"><fmt:message key="label.showtimeId"/></label>
                                    <form:input path="id" readonly="true" class="form-control"/>
                                </div>
                                <div class="form-group">

                                    <label for="hall"><fmt:message key="label.Hall"/> </label>
                                    <form:select path="hall" class="custom-select">
                                        <option selected disabled><fmt:message key="option.hall"/></option>
                                        <form:options items="${halls}" itemLabel="name" itemValue="id" ></form:options>
                                    </form:select>
                                    <div class="col-sm-6 error">
                                        <form:errors path="hall"></form:errors>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="dateTime"><fmt:message key="label.dateTime"/></label>
                                    <form:input path="dateTime"  readonly="true" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label for="marathonId"><fmt:message key="label.marathon.id"/></label>
                                    <form:input path="movieMarathonId" class="form-control" readonly="true"/>
                                </div>

                                <div class="col"><h4><fmt:message key="label.user"/></h4>
                                    <div class="row ">
                                        <div class="form-group col-sm-5 ">
                                            <label for="user"><fmt:message key="label.user.id"/></label>

                                            <form:input path="user.id"  readonly="true" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-5">
                                            <label for="user"><fmt:message key="label.user.username"/></label>

                                            <form:input path="user.username"  readonly="true" class="form-control"/>
                                        </div>
                                    </div>   
                                    <div class="row ">
                                        <div class="form-group col-sm-5">
                                            <label for="user"><fmt:message key="label.user.firstname"/></label>

                                            <form:input path="user.firstname"  readonly="true" class="form-control"/>
                                        </div>
                                        <div class="form-group col-sm-5">
                                            <label for="user"><fmt:message key="label.user.lastname"/></label>

                                            <form:input path="user.lastname"  readonly="true" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col">
                                <label for="movie"><fmt:message key="label.movie"/> </label>
                                <div class="form-group">
                                    <label for="id"><fmt:message key="label.movieId"/></label>
                                    <div class="col-sm-10">
                                        <form:input path="movie.id" readonly="true" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group" >
                                    <label for="name"><fmt:message key="label.movieName"/></label>
                                    <div class="col-sm-10">
                                        <form:input path="movie.name" readonly="true"  class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name"><fmt:message key="label.movieGenre"/></label>
                                    <div class="col-sm-10">
                                        <form:input path="movie.genre"  readonly="true" class="form-control "/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="director"><fmt:message key="label.director"/></label>
                                    <div class="col-sm-10">
                                        <form:input path="movie.director" readonly="true"  class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="year"><fmt:message key="label.year"/></label>
                                    <div class="col-sm-10">
                                        <form:input path="movie.year"  readonly="true"  class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="duration"><fmt:message key="label.duration"/></label>
                                    <div class="col-sm-10">
                                        <form:input path="movie.duration"  readonly="true"  class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <!--..................-->
                            <div class="row">

                            </div>
                        </div>
                        <div class="col-sm-4" >
                            <input type="submit" value="<fmt:message key="button.showtime.update"/>" class="btn btn-outline-dark " style="background-color:lightgreen;"/>
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
