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
        <title>Pretraga rezervacija</title>
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
            <h2>Pretraga rezervacija </h2>
            <hr>
            <form  method="GET" action="${pageContext.request.contextPath}/reservation/find">
                <div class="form-group col-sm-3">
                    <label for="name">Ime i prezime: </label>
                    <input type="text" name="nameLastname"  class="form-control"/>
                </div>
                <div class="form-group col-sm-3">
                    <label for="email">Email: </label>
                    <input type="text" name="email"  class="form-control"/>
                </div>
                <div class="form-group col-sm-3">
                    <label for="name">Naziv filma:</label>
                    <input type="text" name="movieName"  class="form-control"/>
                </div>
                <div class="form-group col-sm-3">
                    <label for="dateTime">Datum i vreme: </label>
                    <input name="dateTime"  class="form-control"/>
                </div>
                <div class="form-group col-sm-3">
                    <label for="hall">Sala: </label>
                    <input name="hallName"  class="form-control"/>
                </div>
                <input type="submit" class="btn" style="background-color: lightseagreen;"value="Pronadji"/>

            </form>

            <hr style="padding-bottom: 3%;">


            <h2>Sve rezervacije</h2>
            <hr>

            <p>${message}</p>
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Projekcija</th>
                        <th>Ime i prezime</th>
                        <th>email</th>
                        <th>Korisnik koji je uneo</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach
                        items="${reservations}"
                        var="reservation"
                        varStatus="loop">
                        <tr>
                            <td>${reservation.id}</td>
                            <td>${reservation.showtime}</td>
                            <td>${reservation.nameLastname}</td>
                            <td>${reservation.email}</td>
                            <td>${reservation.user}</td>

                            <td>
                                <ul class="navbar-nav mr-auto d-flex justify-content-end">
                                    <div class="dropdown">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            action
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="<c:url value = "/reservation/${reservation.id}/delete/">

                                                </c:url>">Delete</a>

                                            <a class="dropdown-item" href="<c:url value = "/reservation/${reservation.id}/view/">

                                                </c:url>">View</a>
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
