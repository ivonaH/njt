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
        </style>

    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <div class="container">
            <h2>Pretraga projekcija</h2>
            <hr>
            <form method="GET" action="${pageContext.request.contextPath}/showtime/find">
                <div class="form-group col-sm-6">
                    <label for="name">Naziv filma:</label>
                    <input type="text" name="movieName"  class="form-control"/>
                </div>
                <div class="form-group col-sm-6">
                    <label for="dateTime">Datum i vreme: </label>
                    <input name="dateTime"  class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="hall">Sala: </label>
                    <div class="col-sm-6">
                        <select name="hallName" class="custom-select">
                            <option selected disabled>Odaberite salu: </option>
                            <c:forEach items="${halls}" var="hall">
                                <option name="${hall.name}">${hall.name}</option>>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <input type="submit" class="btn" style="background-color: lightseagreen;"value="Pronadji"/>

            </form>
            <hr style="padding-bottom: 3%;">

            <h2>Sve projekcije</h2>
            <hr>
            <p>${message}</p>
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Film</th>
                        <th>Datum i vreme</th>
                        <th>Sala</th>
                        <th>Korisnik</th>
                        <th>Slobodna mesta</th>
                        <th>Akcija</th>
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
                            <td>${showtime.user}</td>
                            <td>${showtime.freeSeats}</td>

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
                                            <a class="dropdown-item" href="<c:url value = "/reservation/new?showtimeId=${showtime.id}">

                                                </c:url>">Kreiraj rezervaciju</a>
                                        </div
                                    </div>
                                </ul>
                            </td>
                            <td>
                                <a class="ikonica" href="<c:url value = "/mm/new?showtimeId=${showtime.id}"> </c:url>">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-film" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M0 1a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z"/>
                                        </svg>
                                        <span class="tooltiptextMM">Dodaj projekciju na filmski marathon</span>

                                    </a>
                                </td>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>


        </div>
    </body>
</html>
