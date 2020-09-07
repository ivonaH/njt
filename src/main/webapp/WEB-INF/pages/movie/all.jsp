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

        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>

        <style>
            .green{
                background-color: lightgreen;
                font-size: 13px;

            }
             .green:hover{
                text-decoration: none;
                background-color:  #6C757D;
                color: white;
            }
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
            .ikonica{
                color:lightgreen;
                font-size: 20px;
            }
            .ikonica:hover{
                color:#6C757D;
                text-decoration: none;

            }
        </style>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">
            <div class="container"  style='margin-top:8%;'>

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
                                    <th><fmt:message key="label.user"/></th>
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
                                            <a class="green btn" href="<c:url value = "/showtime/new?movieId=${movie.id}">
                                               </c:url>"><fmt:message key="label.newShowtime"/></a>
                                            </a>
                                        </td>
                                           <td>
                                        


                                            <!--NOVO-->
                                            <span>

                                                <a class="ikonica"  href="<c:url value = "/movie/${movie.id}/delete/">
                                                   </c:url>">
                                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                    </svg>
                                                </a>

                                                <a class="ikonica" href="<c:url value = "/movie/${movie.id}/view/">
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
            <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/popper.js/1.16.0/umd/popper.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.js"></script>
    </body>
</html>
