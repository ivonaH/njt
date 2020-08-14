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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script type="text/javascript" src="js/bootstrap-timepicker.min.js"></script>

    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <div class="container">
            <fmt:bundle basename="i18n/config">
                <h2><fmt:message key="newShowtime.infoMessage"/></h2>
                <hr>
                <div>
                    ${movieStatus}
                    ${selectedMovieId}
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
                            <div>
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
                            <div>
                                <form:errors path="hall"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dateTime"><fmt:message key="label.dateTime"/> </label>
                            <div class="col-sm-6">
                                <form:input type="date" path="dateTime" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}"/>
                            </div>
                            <div>
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

    </body>
</html>
