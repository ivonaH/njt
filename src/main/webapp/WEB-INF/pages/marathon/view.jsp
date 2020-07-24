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
        <title>Prikaz maratona</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <div class="container" style="margin-top: 3%;margin-bottom: 3%;">
                <h2><fmt:message key="viewMarathon.infoMessage"/></h2>
                <hr>

                <div class="form-group col-sm-6">
                    <label for="id"><fmt:message key="label.marathon.id"/> </label>
                    <input name="mm.id" value="${mm.id}" disabled="true" class="form-control"/>
                </div>
                <div class="form-group col-sm-6">
                    <label for="name"><fmt:message key="label.marathon.name"/> </label>
                    <input name="mm.name" value="${mm.name}" disabled="true" class="form-control"/>
                </div>
                <h4 style="margin-top:3%;margin-bottom: 2%;"><fmt:message key="label.marathon.showtimes"/></h4>
                <table class="table table-dark" id='table1'>
                    <thead>
                        <tr>
                            <th><fmt:message key="label.marathon.id"/></th>
                            <th><fmt:message key="label.dateTime"/></th>
                            <th><fmt:message key="label.movie"/></th>
                            <th><fmt:message key="label.Hall"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach
                            items="${mm.showtimes}"
                            var="showtime"
                            varStatus="loop">
                            <tr id="${showtime.id}">
                                <td>${showtime.id}</td>
                                <td>${showtime.dateTime}</td>
                                <td>${showtime.movie}</td>
                                <td>${showtime.hall}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div>

                </div>
            </fmt:bundle>
    </body>
</html>