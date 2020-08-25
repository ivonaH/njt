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
            <title><fmt:message key="newReservation.infoMessage"/></title>
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
                <h2><fmt:message key="newReservation.infoMessage"/></h2>
                <hr>
                <div>
                    ${message}
                </div>
                <div>
                    <form:form modelAttribute="reservation" method="POST" action="${pageContext.request.contextPath}/reservation/save" >

                        <div class="form-group">
                            <label for="showtime"><fmt:message key="label.showtime"/></label>
                            <div class="col-sm-6">

                                <form:select path="showtime" class="custom-select">
                                    <c:if test="${not empty selectedShowtimeId}">
                                        <c:forEach items="${showtimes}" var="showtime">
                                              <fmt:formatDate value="${showtime.dateTime}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                            <option value="${showtime.id}" label="${showtime.id} ${showtime.movie.name} ${myDate} ${showtime.hall.name}"
                                                    <c:if test="${showtime.id eq selectedShowtimeId}">selected="selected"</c:if> />
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty selectedShowtimeId}">
                                        <option selected disabled><fmt:message key="option.showtime"/></option>
                                        <c:forEach items="${showtimes}" var="showtime">
                                            <option value="${showtime.id}" label="${showtime.id} ${showtime.movie.name} ${myDate} ${showtime.hall.name}"/>
                                        </c:forEach>
                                    </c:if>
                                </form:select>
                            </div>
                            <div class="col-sm-6 error">
                                <form:errors path="showtime"></form:errors>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="nameLastname"><fmt:message key="label.nameLastname"/></label>
                            <div class="col-sm-6">
                                <form:input path="nameLastname" class="form-control"/>
                            </div>
                            <div class="col-sm-6 error">
                                <form:errors path="nameLastname"></form:errors>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email"><fmt:message key="label.email"/> </label>
                            <div class="col-sm-6">
                                <form:input path="email" class="form-control"/>
                            </div>
                            <div class="col-sm-6 error">
                                <form:errors path="email"></form:errors>
                                </div>
                            </div>

                            <div class="col-sm-6" >
                                <input type="submit" value="<fmt:message key="button.saveReservation"/>" class="btn btn-outline-dark " style="background-color:lightgreen;"/>
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
