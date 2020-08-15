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
            <title><fmt:message key="showtimeSearch.infoMessage"/></title>
        </fmt:bundle>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.css">
        <script src="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.js"></script>


        <style>
            .ikonica{
                color:lightgreen;
                font-size: 25px;
            }
            .ikonica:hover{
                color:#6C757D;
            }
            .tooltiptextMM {
                font-size: 15px;
                visibility: hidden;
                width: 120px;
                background-color: #6C757D;
                color: lightgreen;
                text-align: center;
                padding: 5px 5px;
                border-radius: 4px;
                border-style:inset;
                border-color: lightgray;

                /* Position the tooltip text - see examples below! */
                position: absolute;
                z-index: 1;
            }
            .ikonica:hover .tooltiptextMM{
                visibility: visible;

            }
            .btn-holder{
                text-align: center;
            }
            .btnNadji{
                background-color: lightgreen;
                color:white;
            }
            .btnNadji:hover{
                background-color:#6C757D ;
                color: lightgreen;
            }
            .linkAdd{
                background-color: #6C757D;
                color: lightgreen;


            }
            .green{
                background-color: lightgreen;

            }
            .linkAdd:hover{
                text-decoration: none;
                background-color:  #6C757D;
                color:white;
            }
            .green:hover{
                text-decoration: none;
                background-color:  #6C757D;
                color: white;
            }
        </style>

    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">
            <div class="container">
                <h2><fmt:message key="showtimeSearch.infoMessage"/></h2>
                <hr>
                <form method="GET" action="${pageContext.request.contextPath}/showtime/find">
                    <div class="row">
                        <div class="form-group col-sm-4">
                            <label for="name"><fmt:message key="label.movie"/></label>
                            <input type="text" name="movieName"  class="form-control"/>
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="dateTime"><fmt:message key="label.dateTime"/></label>
                            <input name="dateTime"  class="form-control"/>
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="hall"><fmt:message key="label.Hall"/> </label>
                            <select name="hallName" class="custom-select">
                                <option selected disabled><fmt:message key="option.hall"/></option>
                                <c:forEach items="${halls}" var="hall">
                                    <option name="${hall.name}">${hall.name}</option>>
                                </c:forEach>
                            </select>

                        </div>
                    </div>
                    <div class="btn-holder">
                        <input type="submit" class="btn btnNadji"  " value="<fmt:message key="button.search"/>"/>
                    </div>

                </form>
                <hr style="margin-bottom: 3%;">

                <h2><fmt:message key="search.Result"/></h2>
                <hr>
                <p>${message}</p>
                <p>${mmMessage}</p>
                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th><fmt:message key="label.showtimeId"/></th>
                            <th><fmt:message key="label.movie"/></th>
                            <th><fmt:message key="label.dateTime"/></th>
                            <th><fmt:message key="label.Hall"/></th>
                            <th><fmt:message key="label.user"/></th>
                            <th><fmt:message key="label.freeSeats"/></th>
                            <th><fmt:message key="label.action"/></th>
                            <th><fmt:message key="link.marathon"/></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach
                            items="${showtimes}"
                            var="showtime"
                            varStatus="loop">
                            <tr>
                                <td>${showtime.id}</td>
                                <td>${showtime.movie.name}</td>
                                <td>${showtime.dateTime}</td>
                                <td>${showtime.hall}</td>
                                <td>${showtime.user.username}</td>
                                <td>${showtime.freeSeats}</td>

                                <td>
                                    <ul class="navbar-nav mr-auto d-flex justify-content-end">
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <fmt:message key="label.action"/>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="<c:url value = "/showtime/${showtime.id}/delete/">

                                                    </c:url>"><fmt:message key="label.delete"/></a>

                                                <a class="dropdown-item" href="<c:url value = "/showtime/${showtime.id}/view/">

                                                    </c:url>"><fmt:message key="label.view"/></a>
                                                <a class="dropdown-item" href="<c:url value = "/reservation/new?showtimeId=${showtime.id}">

                                                    </c:url>"><fmt:message key="label.createReservation"/></a>
                                            </div
                                        </div>
                                    </ul>
                                </td>

                                <c:if test="${showtime.movieMarathonId == 0}">
                                    <c:set var="contains" value="false" />
                                    <c:forEach var="item" items="${mm.showtimes}">
                                        <c:if test="${item.id eq showtime.id}">
                                            <c:set var="contains" value="true" />
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${!contains}">
                                        <td>
                                            <a class="green btn" href="<c:url value = "/mm/addShowtime/${showtime.id}" >
                                               </c:url>">
                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-film" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M0 1a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z"/>
                                                </svg>
                                                <fmt:message key="label.addToMarathon"/>

                                            </a>
                                        </td>
                                    </c:if>
                                    <c:if test="${contains}">
                                        <td>
                                            <a class="linkAdd btn" href="<c:url value = "/mm/removeShowtime/${showtime.id}" >
                                               </c:url>">
                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>
                                                <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>
                                                </svg>
                                                <fmt:message key="label.removeShowtime"/>
                                            </a>
                                        </td>
                                    </c:if>



                                </c:if>
                                        <c:if test="${showtime.movieMarathonId != 0}">
                                            <td>
                                                ${showtime.movieMarathonId}
                                            </td>    
                                        </c:if>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


            </div>
        </fmt:bundle>
        <%@include file="/WEB-INF/pages/template/footer.jsp" %>

    </body>
</html>
