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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.css">
        <script src="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.js"></script>

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
            <div class="container">
                <h2><fmt:message key="link.searchReservation"/></h2>
                <hr>
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

                <p>${reservationStatus}</p>
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
                                <td>${reservation.showtime.dateTime}<br> Film: ${reservation.showtime.movie.name}<br> Salla: ${reservation.showtime.hall.name}</td>
                                <td>${reservation.nameLastname}</td>
                                <td>${reservation.email}</td>
                                <td>${reservation.user}</td>

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
    </body>
</html>
