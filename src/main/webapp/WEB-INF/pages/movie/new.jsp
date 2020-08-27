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
            <title><fmt:message key="newMovie.infoMessage"/></title>
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
            <div class="container"  style='margin-top:8%;'>
                <h2><fmt:message key="newMovie.infoMessage"/></h2>
                <hr>
                <c:if test="${not empty movieStatus}">
                    <div class="alert alert-success" role="alert">

                        ${movieStatus}
                    </div>

                </c:if>
                <div>
                    <form:form modelAttribute="movie" method="POST" action="${pageContext.request.contextPath}/movie/save" >
                        <div class="form-group" >
                            <label for="name"><fmt:message key="label.movieName"/></label>
                            <div class="col-sm-6">
                                <form:input path="name" class="form-control"/>
                            </div>
                            <div class="col-sm-6 error">
                                <form:errors path="name"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name"><fmt:message key="label.movieGenre"/></label>
                            <div class="col-sm-6">
                                <form:select path="genre" class="custom-select">
                                    <option selected disabled><fmt:message key="option.genre"/></option>
                                    <form:options items="${genres}"></form:options>
                                </form:select>
                            </div>
                            <div class="col-sm-6 error">
                                <form:errors path="genre"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="director"><fmt:message key="label.director"/></label>
                            <div class="col-sm-6">
                                <form:input path="director" class="form-control"/>
                            </div>
                            <div class="col-sm-6 error">
                                <form:errors path="director"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="year"><fmt:message key="label.year"/></label>
                            <div class="col-sm-6">
                                <form:input path="year" class="form-control"/>
                            </div>
                            <div class="col-sm-6 error">
                                <form:errors path="year"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="duration"><fmt:message key="label.duration"/></label>
                            <div class="col-sm-6">
                                <form:input path="duration" class="form-control"/>
                            </div>
                            <div class="col-sm-6 error">
                                <form:errors path="duration"></form:errors>
                                </div>
                            </div>
                            <div class="col-sm-6" >
                                <input type="submit" value="<fmt:message key="button.saveMovie"/>" class="btn btn-outline-dark " style="background-color:lightgreen;"/>
                        </div>
                    </form:form>
                </div>
            </div>
        </fmt:bundle>
        <%@include file="/WEB-INF/pages/template/footer.jsp" %>
        <%@include file="/WEB-INF/pages/template/footer.jsp" %>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/popper.js/1.16.0/umd/popper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.js"></script>
    </body>
</html>
