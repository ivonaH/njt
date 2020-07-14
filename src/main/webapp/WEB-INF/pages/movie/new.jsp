<%-- 
    Document   : new
    Created on : 12-Jul-2020, 16:51:44
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novi film</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <div class="container">
            <h2>Kreiraj novi film </h2>
            <div>
                ${movieStatus}
            </div>
            <div align="left">
                <form:form modelAttribute="movie" method="POST" action="${pageContext.request.contextPath}/movie/save" >
                    <div class="form-group">
                        <label for="name">Name: </label>
                        <div class="col-sm-6">
                            <form:input path="name" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name">Genre: </label>
                        <div class="col-sm-6">
                            <form:select path="genre" class="custom-select">
                                <option selected disabled>Odaberite zanr filma</option>
                                <form:options items="${genres}"></form:options>
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="director">Director: </label>
                        <div class="col-sm-6">
                            <form:input path="director" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="year">Year: </label>
                        <div class="col-sm-6">
                            <form:input path="year" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="duration">Duration: </label>
                        <div class="col-sm-6">
                            <form:input path="duration" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-sm-6" >
                        <input type="submit" value="Save" class="btn btn-outline-dark " style="background-color:lightgreen;"/>
                    </div>
                </form:form>
            </div>
        </div>
    </body>
</html>
