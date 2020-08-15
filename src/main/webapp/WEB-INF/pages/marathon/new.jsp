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
        </fmt:bundle>        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <style>
            .linkAdd{
                background-color: lightgray;

            }
            .linkAdd:hover{
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
        </style>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">
            <div class="container" style="margin-top: 3%;margin-bottom: 3%;">
                <h2><fmt:message key="newMarathon.infoMessage"/></h2>
                <hr>

                
                <br> <h3><fmt:message key="label.addedShowtimes"/></h3>
                <br><hr>
                <br>
                <br>
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
                                <td>${showtime.dateTime}</td>
                                <td>${showtime.movie}</td>
                                <td>${showtime.hall}</td>
                                <td><a class="linkAdd btn" href="<c:url value = "/mm/removeShowtime/${showtime.id}" >
                                       </c:url>"><fmt:message key="label.removeShowtime"/></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div>
                    <form:form action="${pageContext.request.contextPath}/mm/save" method="POST" modelAttribute="movieMarathon">
                        <div class="form-group">
                            <label for="name"><fmt:message key="label.marathon.name"/> </label>
                            <form:input path="name"/>
                            <form:errors path="name" ></form:errors> 
                            </div>
                            <input type="submit" value="<fmt:message key="button.saveMarathon"/>" class="btn btn-outline-dark " style="background-color:lightgreen;" />
                    </form:form>
                </div>
            </div>

        </fmt:bundle>
        
        <%@include file="/WEB-INF/pages/template/footer.jsp" %>
    </body>
</html>