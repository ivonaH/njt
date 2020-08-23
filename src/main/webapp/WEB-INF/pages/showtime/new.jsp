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
            <title><fmt:message key="newShowtime.infoMessage"/></title>
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
        <div class="container">
            <fmt:bundle basename="i18n/config">
                <h2><fmt:message key="newShowtime.infoMessage"/></h2>
                <hr>
                <div>
                    ${movieStatus}
                </div>
                <div>
                    <form:form modelAttribute="showtime" method="POST" action="${pageContext.request.contextPath}/showtime/save" >
                        <div class="form-group">
                            <label for="movie"><fmt:message key="label.movie"/> </label>
                            <div class="col-sm-6">

                                <form:select path="movie" class="custom-select">
                                    <c:if test="${empty selectedMovieId}">
                                        <option selected disabled><fmt:message key="option.movie"/> </option>
                                        <c:forEach items="${movies}" var="movie">
                                            <option value="${movie.id}" label="${movie.name}"/>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${not empty selectedMovieId}">
                                        <c:forEach items="${movies}" var="movie">
                                            <option value="${movie.id}" label="${movie.name}"
                                                    <c:if test="${movie.id eq selectedMovieId}">selected="selected"</c:if> />
                                        </c:forEach>
                                    </c:if>
                                </form:select>
                            </div>
                            <div class="col-sm-6 error">
                                <form:errors path="movie"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="hall"><fmt:message key="label.Hall"/>  </label>
                            <div class="col-sm-6">
                                <form:select path="hall" class="custom-select">
                                    <option selected disabled><fmt:message key="option.hall"/>  </option>
                                    <form:options items="${halls}" itemLabel="name" itemValue="id" ></form:options>
                                </form:select>
                            </div>
                            <div class="col-sm-6 error">
                                <form:errors path="hall"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dateTime"><fmt:message key="label.dateTime"/> </label>
                            <div class="col-sm-6">
                                <form:input type="text" path="dateTime" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}" title="2020-12-12 12:00:00" class="form-control"/>
                            </div>
                            <div class="error col-sm-6" role="alert">
                                <form:errors path="dateTime"></form:errors>
                            </div>
                            </div>
                            <div class="col-sm-6" >
                                <input type="submit" value="<fmt:message key="button.saveShowtime"/> " class="btn btn-outline-dark " style="background-color:lightgreen;"/>
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
