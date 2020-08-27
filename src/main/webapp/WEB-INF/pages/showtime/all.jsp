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
                font-size: 15px;
            }
            .ikonica:hover{
                color:#6C757D;
            }
            .tooltiptextMM {
                font-size: 10px;
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
                font-size: 14px;

            }
            .green{
                background-color: lightgreen;
                font-size: 13px;

            }
            .ikonica{
                color:lightgreen;
                font-size: 20px;
            }
            .ikonica:hover{
                color:#6C757D;
                text-decoration: none;

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
            <div class="container"  style='margin-top:8%;'>
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

                                    <a class="ikonica" href="<c:url value = "/reservation/new?showtimeId=${showtime.id}">

                                        </c:url>"><fmt:message key="label.createReservation"/>
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M11 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM1.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM6 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm4.5 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
                                        <path fill-rule="evenodd" d="M13 7.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z"/>
                                        </svg>
                                    </a>
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
                                <td>
                                    <span>

                                        <a class="ikonica" href="<c:url value = "/showtime/${showtime.id}/delete/">

                                            </c:url>">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                            </svg>
                                        </a>

                                        <a class="ikonica" href="<c:url value = "/showtime/${showtime.id}/view/">

                                            </c:url>">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z"/>
                                            <path fill-rule="evenodd" d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                            </svg>
                                        </a>

                                    </span>
                                </td>
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
