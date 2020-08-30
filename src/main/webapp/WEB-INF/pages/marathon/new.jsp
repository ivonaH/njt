<%-- 
    Document   : new
    Created on : 18-Jul-2020, 08:52:11
    Author     : root
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <title><fmt:message key="newMarathon.infoMessage"/></title>
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
            .floatM{
                position:fixed;
                width:60px;
                height:60px;
                bottom:80px;
                right:40px;
                background-color:#0C9;
                color:#FFF;
                border-radius:50px;
                text-align:center;
                box-shadow: 2px 2px 3px #999;
                padding-top:15px;

            }

            .my-floatM{
                margin-top:22px;
            }
        </style>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">
            <div class="container"  style='margin-top:8%;'>
                <h1><fmt:message key="newMarathon.infoMessage"/></h1>
                <hr>
                <p>${message}</p>
                <a href="#end">
                    <div class="floatM bg-dark" href="#end">
                        <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-arrow-down" fill="currentColor" xmlns="http://www.w3.org/2000/svg" class="my-floatM">
                        <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
                        </svg>
                    </div>
                </a>
                <c:if test="${not empty mmError}">
                    <div class="alert alert-danger" role="alert">
                        <p>${mmError}</p>
                    </div>
                </c:if>
                <c:if test="${not empty mmSuccess}">
                    <div class="alert alert-success" role="alert">
                        <p>${mmSuccess}</p>
                    </div>
                </c:if>
                <c:if test="${not empty mmMessage}">
                    <div class="alert alert-success" role="alert">
                        <p>${mmMessage}</p>
                    </div>
                </c:if>
                <c:if test="${empty mm.showtimes}">
                    <form method="GET" action="${pageContext.request.contextPath}/mm/showtimes">
                        <div class="row">
                            <div class="form-group col-sm-4">
                                <label for="dateTime"><fmt:message key="label.dateTime"/></label>
                                <input name="dateTime" class="form-control"/>
                            </div>
                        </div>
                        <div class="btn-holder">
                            <input type="submit" class="btn btnNadji btn-dark"  " value="<fmt:message key="button.search"/>"/>
                        </div>

                    </form>
                    <hr style="margin-bottom: 3%;">
                </c:if>

                <h2><fmt:message key="search.Result"/></h2>
                <hr>

                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th><fmt:message key="label.showtimeId"/></th>
                            <th><fmt:message key="label.movie"/></th>
                            <th><fmt:message key="label.dateTime"/></th>
                            <th><fmt:message key="label.Hall"/></th>
                            <th><fmt:message key="label.user"/></th>
                            <th><fmt:message key="link.marathon"/></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach
                            items="${showtimesAll}"
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



                <!--OLD-->

                <br> <h3><fmt:message key="label.addedShowtimes"/></h3>


                <br><hr>
                <br>
                <c:if test="${empty mm.showtimes}">
                    <a class="btn btn-dark" href="<c:url value = "/showtime/all/1" >
                       </c:url>"><fmt:message key="label.addToMarathon"/></a>
                </c:if>
                <br>
                <c:if test="${not empty mm.showtimes}">
                    <table class="table table-dark" id='table1'>
                        <thead>
                            <tr>
                                <th><fmt:message key="label.showtimeId"/></th>
                                <th><fmt:message key="label.dateTime"/></th>
                                <th><fmt:message key="label.movie"/></th>
                                <th><fmt:message key="label.Hall"/></th>
                                <th><fmt:message key="label.action"/></th>
                            </tr>
                        </thead>
                        <tbody path>
                            <c:forEach
                                items="${mm.showtimes}"
                                var="showtime"
                                varStatus="loop">
                                <tr id="${showtime.id}">
                                    <td>${showtime.id}</td>
                                    <fmt:formatDate value="${showtime.dateTime}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                    <td>${myDate}</td>
                                    <td>${showtime.movie}</td>
                                    <td>${showtime.hall}</td>
                                    <td><a class="linkAdd btn" href="<c:url value = "/mm/removeShowtime/${showtime.id}" >
                                           </c:url>"><fmt:message key="label.removeShowtime"/></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <br>
                <div id="end">
                    <form:form action="${pageContext.request.contextPath}/mm/save" method="POST" modelAttribute="movieMarathon">
                        <div class="form-group">
                            <label for="name"><fmt:message key="label.marathon.name"/> </label>
                            <div class="col-sm-6">
                                <form:input path="name" class="form-control"/>
                                <div class="col-sm-6 error">
                                    <form:errors path="name" ></form:errors> 
                                    </div>
                                </div>
                            </div>
                            <input type="submit" value="<fmt:message key="button.saveMarathon"/>" class="btn btn-outline-dark " style="background-color:lightgreen;" />
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