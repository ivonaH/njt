<%-- 
    Document   : new
    Created on : 18-Jul-2020, 08:52:11
    Author     : root
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novi maraton</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
        </style>
        
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>

        <div class="container" style="margin-top: 3%;margin-bottom: 3%;">
            <h2>Kreiraj novi maraton </h2>
            <hr>

            <table class="table table-dark" id='table1'>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Datum i Vreme</th>
                        <th>Film</th>
                        <th>Sala</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach
                        items="${showtimes}"
                        var="showtime"
                        varStatus="loop">
                        <tr id="${showtime.id}">
                            <td>${showtime.id}</td>
                            <td>${showtime.dateTime}</td>
                            <td>${showtime.movie}</td>
                            <td>${showtime.hall}</td>
                            <c:set var="contains" value="false" />
                            <c:forEach var="item" items="${addedShowtimes}">
                                <c:if test="${item.id eq showtime.id}">
                                    <c:set var="contains" value="true" />
                                </c:if>
                            </c:forEach>

                            <c:if test="${!contains}">
                                <td>
                                    <a class="linkAdd btn" href="<c:url value = "/mm/addShowtime/${showtime.id}" >
                                       </c:url>">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M9.828 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91H9v1H2.826a2 2 0 0 1-1.991-1.819l-.637-7a1.99 1.99 0 0 1 .342-1.31L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3h3.982a2 2 0 0 1 1.992 2.181L15.546 8H14.54l.265-2.91A1 1 0 0 0 13.81 4H9.828zm-2.95-1.707L7.587 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 0 1 1-.98h3.672a1 1 0 0 1 .707.293z"/>
                                        <path fill-rule="evenodd" d="M13.5 10a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
                                        <path fill-rule="evenodd" d="M13 12.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z"/>
                                        </svg> Dodaj na maraton
                                    </a>
                                </td>
                            </c:if>
                            <c:if test="${contains}">
                                <td>
                                    Projekcija je vec dodata 
                                    
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br> <h1>Dodate projekcije:</h1>
            <br><hr>
            ${mmMessage}
            <br>
            <br>
            <table class="table table-dark" id='table1'>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Datum i Vreme</th>
                        <th>Film</th>
                        <th>Sala</th>
                        <th>Akcija</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach
                        items="${addedShowtimes}"
                        var="showtime"
                        varStatus="loop">
                        <tr id="${showtime.id}">
                            <td>${showtime.id}</td>
                            <td>${showtime.dateTime}</td>
                            <td>${showtime.movie}</td>
                            <td>${showtime.hall}</td>
                            <td><a class="linkAdd btn" href="<c:url value = "/mm/removeShowtime/${showtime.id}" >
                                   </c:url>">Ukloni projekciju sa maratona</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div>
                <form action="${pageContext.request.contextPath}/mm/save" method="POST" modelAttribute="mm">
                    <div class="form-group">
                        <label for="name">Naziv maratona: </label>
                        <input type="text" name="name"/>
                    </div>
                    <input type="submit" value="Save" class="btn btn-outline-dark " style="background-color:lightgreen;" />
                </form>
            </div>
        </div>


                    
    </body>
</html>