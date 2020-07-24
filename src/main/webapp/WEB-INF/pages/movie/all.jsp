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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pretraga filmova</title>
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
                background-color: lightgreen;
                color:white;
            }
            .btnNadji:hover{
                background-color:#6C757D ;
                color: lightgreen;
            }
        </style>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <div class="container">

            <h2>Pretraga filmova</h2>
            <hr>
            <form method="GET"  action="${pageContext.request.contextPath}/movie/find">
                <div class="row">
                     <div class="form-group col-sm-3">
                    <label for="name">Naziv:</label>
                    <input type="text" name="name"  class="form-control"/>
                </div>
                <div class="form-group col-sm-3">
                    <label for="director">Reziser:</label>
                    <input name="director"  class="form-control"/>
                </div>
                <div class="form-group col-sm-3">
                    <label for="year">Godina:</label>
                    <input name="year"  class="form-control"/>
                </div>
                <div class="form-group col-sm-3">
                    <label for="genre">Genre: </label>
                    <select name="genre" class="custom-select">
                        <option selected disabled>Odaberite zanr filma</option>
                        <c:forEach items="${genres}" var="genre">
                            <option value="${genre}">${genre}</option>
                        </c:forEach>
                    </select>
                </div>
                </div>
                <div class="btn-holder">
                <input type="submit" class="btn btnNadji" value="Pronadji"/>
                </div>

            </form>
            <hr style="padding-bottom: 3%;">

            <h2>Svi filmovi</h2>
            <hr>
            <div>
                <div>
                    <p>${message}</p>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Naziv</th>
                                <th>Producent</th>
                                <th>Zanr</th>
                                <th>Korisnik</th>
                                <th>Godina</th>
                                <th>Trajanje</th>
                                <th>Akcija</th>
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
                                    <td>${movie.user}</td>
                                    <td>${movie.year}</td>
                                    <td>${movie.duration}</td>
                                    <td>
                                        <ul class="navbar-nav mr-auto d-flex justify-content-end">
                                            <div class="dropdown">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    action
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="<c:url value = "/movie/${movie.id}/delete/">
                                                       </c:url>">Delete</a>

                                                    <a class="dropdown-item" href="<c:url value = "/movie/${movie.id}/view/">
                                                       </c:url>">View</a>
                                                    <a class="dropdown-item" href="<c:url value = "/showtime/new?movieId=${movie.id}">
                                                       </c:url>">Nova projekcija</a>
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
    </body>
</html>
