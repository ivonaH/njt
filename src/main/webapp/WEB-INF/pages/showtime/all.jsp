<%-- 
    Document   : all
    Created on : 14-Jul-2020, 12:56:21
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Pretraga projekcija</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.css">
        <script src="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.js"></script>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <div class="container">
            <h2>Sve projekcije</h2>
            <p>${message}</p>
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Film</th>
                        <th>Datum i vreme</th>
                        <th>Sala</th>
                        <th>Korisnik</th>
                        <th>Akcija</th>
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
                            <td>${showtime.user}</td>

                            <td>
                                <ul class="navbar-nav mr-auto d-flex justify-content-end">
                                    <div class="dropdown">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            action
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="<c:url value = "/showtime/${showtime.id}/delete/">

                                                </c:url>">Delete</a>

                                            <a class="dropdown-item" href="<c:url value = "/showtime/${showtime.id}/view/">

                                                </c:url>">View</a>
                                            <a class="dropdown-item" href="<c:url value = "/showtime/${showtime.id}/reservation/">

                                                </c:url>">Kreiraj rezervaciju</a>
                                        </div>
                                    </div>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


        </div>
    </body>
</html>
