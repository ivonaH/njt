<%-- 
    Document   : all
    Created on : 14-Jul-2020, 12:56:21
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <title><fmt:message key="link.searchReservation"/></title>
        </fmt:bundle>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>

        <style>
            .btn-holder{
                text-align: center;
            }
            .btnNadji{
                color: lightgreen;
            }
            .btnNadji:hover{
                color: lightgreen;
                background-color:#6C757D ;
            }
            body{
                padding-bottom: 5%;
            }
            .container {
                background-color: #f2f2f2;
                padding: 5px 20px 15px 20px;
                border: 1px solid lightgrey;
                border-radius: 3px;
            }
            .pageNavigation{
                text-align: center;
                color:#6C757D;
                font-size: 20px;

            }

            .pageNavigation a{
                color:black;
            }
            .pageNavigation a:hover{
                color:lightgreen;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">
            <div class="container"  style='margin-top:8%;'>
                <h2><fmt:message key="link.searchReservation"/></h2>
                <hr>
                  <c:if test="${not empty reservationStatus}">
                    <div class="alert alert-success" role="alert">

                        ${reservationStatus}
                    </div>

                </c:if>
                <form  method="GET" action="${pageContext.request.contextPath}/reservation/find/1">
                    <div class="row">
                        <div class="form-group col-sm-3">
                            <label for="name"><fmt:message key="label.nameLastname"/> </label>
                            <input type="text" name="nameLastname" value="${param.nameLastname}"  class="form-control"/>
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="email"><fmt:message key="label.email"/> </label>
                            <input type="text" name="email" value="${param.email}" class="form-control"/>
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="name"><fmt:message key="label.movie"/></label>
                            <input type="text" name="movieName" value="${param.movieName}" class="form-control"/>
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="dateTime"><fmt:message key="label.dateTime"/></label>
                            <input name="dateTime" value="${param.dateTime}" class="form-control"/>
                        </div>

                    </div>
                    <div class="btn-holder">
                        <input type="submit" class="btn btnNadji btn-dark" value="<fmt:message key="button.search"/>"/>
                    </div>
                </form>

                <hr style="padding-bottom: 3%;">


                <h2><fmt:message key="search.Result"/></h2>
                <hr>

              
                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th><fmt:message key="label.reservationId"/></th>
                            <th><fmt:message key="label.showtime"/></th>
                            <th><fmt:message key="label.nameLastname"/></th>
                            <th><fmt:message key="label.email"/></th>
                            <th><fmt:message key="label.user"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach
                            items="${reservations}"
                            var="reservation"
                            varStatus="loop">
                            <tr>
                                <td>${reservation.id}</td>
                                <fmt:formatDate value="${reservation.showtime.dateTime}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                <td>${myDate}<br> Film: ${reservation.showtime.movie.name}<br> Salla: ${reservation.showtime.hall.name}</td>
                                <td>${reservation.nameLastname}</td>
                                <td>${reservation.email}</td>
                                <td>${reservation.user.username}</td>

                                <td>
                                    <ul class="navbar-nav mr-auto d-flex justify-content-end">
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <fmt:message key="label.action"/>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="<c:url value = "/reservation/${reservation.id}/delete/">

                                                    </c:url>"><fmt:message key="label.delete"/></a>

                                                <a class="dropdown-item" href="<c:url value = "/reservation/${reservation.id}/view/">

                                                    </c:url>"><fmt:message key="label.view"/></a>
                                            </div>
                                        </div>
                                    </ul>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="pageNavigation">
                    <c:forEach begin="1" end="${totalPages}" step="1" var="i">
                        <c:if test="${currentPage!=i}">
                            <c:if test="${empty paramValues}">
                                <a  href="${pageContext.request.contextPath}/reservation/all/${i}">
                                    <c:out value = "${i}"/>
                                </c:if>
                                <c:if test="${not empty paramValues}">
                                    <a  href="${pageContext.request.contextPath}/reservation/find/${i}?nameLastname=${param.nameLastname}&email=${param.email}&dateTime=${param.dateTime}&movieName=${param.movieName}">
                                        <c:out value = "${i}"/>
                                    </c:if>
                                </a>
                            </c:if>
                            <c:if test="${currentPage==i}">
                                <u><c:out value = "${i}"/></u>
                                </c:if>
                            </c:forEach>
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
