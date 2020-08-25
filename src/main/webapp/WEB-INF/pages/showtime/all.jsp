<%-- 
    Document   : all
    Created on : 14-Jul-2020, 12:56:21
    Author     : root
--%>

<%@page import="java.text.SimpleDateFormat"%>
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
         <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>


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
                color:lightgreen;
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
                <h2><fmt:message key="showtimeSearch.infoMessage"/></h2>
                <hr>
                <c:if test="${not empty showtimeStatus}">
                    <div class="alert alert-success" role="alert">

                        ${showtimeStatus}
                    </div>

                </c:if>
                <form method="GET" action="${pageContext.request.contextPath}/showtime/find/1">
                    <div class="row">
                        <div class="form-group col-sm-4">
                            <label for="name"><fmt:message key="label.movie"/></label>
                            <input type="text" name="movieName"  class="form-control" value="${param.movieName}"/>
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="dateTime"><fmt:message key="label.dateTime"/></label>
                            <input name="dateTime"  class="form-control" value="${param.dateTime}"/>
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="hall"><fmt:message key="label.Hall"/> </label>
                            <select name="hallName" class="custom-select">
                                <option selected disabled><fmt:message key="option.hall"/></option>
                                <c:forEach items="${halls}" var="hall">
                                    <option name="${hall.name}" <c:if test="${param.hallName eq hall.name}">selected</c:if>>${hall.name}</option>>
                                </c:forEach>
                            </select>

                        </div>
                    </div>
                    <div class="btn-holder">
                        <input type="submit" class="btn btnNadji btn-dark"  " value="<fmt:message key="button.search"/>"/>
                    </div>

                </form>
                <hr style="margin-bottom: 3%;">

                <h2><fmt:message key="search.Result"/></h2>
                <hr>
                <p>${message}</p>
                <p>${mmError}</p>
                <p>${mmSuccess}</p>
                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th><fmt:message key="label.showtimeId"/></th>
                            <th><fmt:message key="label.movie"/></th>
                            <th><fmt:message key="label.dateTime"/></th>
                            <th><fmt:message key="label.Hall"/></th>
                            <th><fmt:message key="label.user"/></th>
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
                                <td>
                                <fmt:formatDate value="${showtime.dateTime}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                ${myDate}
                                </td>
                                <td>${showtime.hall}</td>
                                <td>${showtime.user.username}</td>

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

                <div class="pageNavigation">
                    <c:forEach begin="1" end="${totalPages}" step="1" var="i">
                        <c:if test="${currentPage!=i}">
                            <c:if test="${empty paramValues}">
                                <a  href="${pageContext.request.contextPath}/showtime/all/${i}">
                                    <c:out value = "${i}"/>
                                </c:if>
                                <c:if test="${not empty paramValues}">
                                    <a  href="${pageContext.request.contextPath}/showtime/find/${i}?movieName=${param.movieName}&dateTime=${param.dateTime}&hallName=${param.hallName}">
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
