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
        <title>Nova rezervacija</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">

            <div class="container">
                <h2><fmt:message key="newReservation.infoMessage"/></h2>
                <hr>
                <div>
                    ${message}
                    ${selectedShowtimeId}
                </div>
                <div>
                    <form:form modelAttribute="reservation" method="POST" action="${pageContext.request.contextPath}/reservation/save" >

                        <div class="form-group">
                            <label for="showtime"><fmt:message key="label.showtime"/></label>
                            <div class="col-sm-6">

                                <form:select path="showtime" class="custom-select">
                                    <c:if test="${not empty selectedShowtimeId}">
                                        <c:forEach items="${showtimes}" var="showtime">
                                            <option value="${showtime.id}" label="${showtime}"
                                                    <c:if test="${showtime.id eq selectedShowtimeId}">selected="selected"</c:if> />
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty selectedShowtimeId}">
                                        <option selected disabled><fmt:message key="option.showtime"/></option>
                                        <c:forEach items="${showtimes}" var="showtime">
                                            <option value="${showtime.id}" label="${showtime}"/>
                                        </c:forEach>
                                    </c:if>
                                </form:select>
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="nameLastname"><fmt:message key="label.nameLastname"/></label>
                            <div class="col-sm-6">
                                <form:input path="nameLastname" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email"><fmt:message key="label.email"/> </label>
                            <div class="col-sm-6">
                                <form:input path="email" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-sm-6" >
                            <input type="submit" value="<fmt:message key="button.saveReservation"/>" class="btn btn-outline-dark " style="background-color:lightgreen;"/>
                        </div>
                    </form:form>
                </div>
            </div>
        </fmt:bundle>
    </body>
</html>
