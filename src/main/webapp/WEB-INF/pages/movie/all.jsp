<%-- 
    Document   : new
    Created on : 12-Jul-2020, 16:51:44
    Author     : root
--%>

<%@page import="java.util.List"%>
<%@page import="com.diplomski.njt.bioskop.pokusaj100.domain.Genre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <title><fmt:message key="movieSearch.infoMessage"/></title>
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
                background-color:#6C757D ;
                color: lightgreen;
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

                <h2><fmt:message key="movieSearch.infoMessage"/></h2>
                <hr>
                <form method="GET"  action="${pageContext.request.contextPath}/movie/find/1">
                    <div class="row">
                        <div class="form-group col-sm-3">
                            <label for="name"><fmt:message key="label.movieName"/></label>
                            <input type="text" name="name" value="${param.name}" class="form-control"/>
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="director"><fmt:message key="label.director"/></label>
                            <input name="director" value="${param.director}" class="form-control"/>
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="year"><fmt:message key="label.year"/></label>
                            <input name="year" value="${param.year}" class="form-control"/>
                        </div>
                        <div class="form-group col-sm-3">
                            <label for="genre"><fmt:message key="label.movieGenre"/></label>
                            <select name="genre" class="custom-select">
                                <option disabled selected="true"><fmt:message key="option.genre"/></option>
                                <c:forEach items="${genres}" var="genre">
                                    <option value="${genre}" <c:if test="${param.genre eq genre}">selected</c:if>>${genre}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="btn-holder">
                        <input type="submit" class="btn btnNadji btn-dark" value="<fmt:message key="button.search"/>"/>
                    </div>

                </form>
                <hr style="padding-bottom: 3%;">
                
                <h2><fmt:message key="search.Result"/></h2>
                <hr>
                <div>
                    <div>
                        <p>${message}</p>
                        <table class="table table-dark">
                            <thead>
                                <tr>
                                    <th><fmt:message key="label.movieId"/></th>
                                    <th><fmt:message key="label.movieName"/></th>
                                    <th><fmt:message key="label.director"/></th>
                                    <th><fmt:message key="label.movieGenre"/></th>
                                    <th><fmt:message key="label.username"/></th>
                                    <th><fmt:message key="label.year"/></th>
                                    <th><fmt:message key="label.duration"/></th>
                                    <th><fmt:message key="label.action"/></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach
                                    items="${movies}"
                                    var="movie"
                                    varStatus="loop">
                                    <tr>
                                        <td>${movie.id}</td>
                                        <td>${movie.name}</td>
                                        <td>${movie.director}</td>
                                        <td>${movie.genre}</td>
                                        <td>${movie.user.username}</td>
                                        <td>${movie.year}</td>
                                        <td>${movie.duration}</td>
                                        <td>
                                            <ul class="navbar-nav mr-auto d-flex justify-content-end">
                                                <div class="dropdown">
                                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <fmt:message key="label.action"/>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                        <a class="dropdown-item" href="<c:url value = "/movie/${movie.id}/delete/">
                                                           </c:url>"><fmt:message key="label.delete"/></a>

                                                        <a class="dropdown-item" href="<c:url value = "/movie/${movie.id}/view/">
                                                           </c:url>"><fmt:message key="label.view"/></a>
                                                        <a class="dropdown-item" href="<c:url value = "/showtime/new?movieId=${movie.id}">
                                                           </c:url>"><fmt:message key="label.newShowtime"/></a>
                                                    </div>
                                                </div>
                                            </ul>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </fmt:bundle>


                <div class="pageNavigation">
                <c:forEach begin="1" end="${totalPages}" step="1" var="i">
                    <c:if test="${currentPage!=i}">
                        <c:if test="${empty paramValues}">
                            <a  href="${pageContext.request.contextPath}/movie/all/${i}">
                                <c:out value = "${i}"/>
                            </c:if>
                            <c:if test="${not empty paramValues}">
                                <a  href="${pageContext.request.contextPath}/movie/find/${i}?name=${param.name}&year=${param.year}&director=${param.director}&genre=${param.genre}">
                                    <c:out value = "${i}"/>
                                </c:if>
                            </a>
                        </c:if>
                        <c:if test="${currentPage==i}">
                            <u><c:out value = "${i}"/></u>
                        </c:if>
                    </c:forEach>
            </div>

            <%@include file="/WEB-INF/pages/template/footer.jsp" %>

    </body>
</html>
