<%-- 
    Document   : home
    Created on : 15-Jul-2020, 11:41:18
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Pocetna strana</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </head>
    <body>

        <%@include file="/WEB-INF/pages/template/menu.jsp" %>
        <c:if test="${empty sessionScope.user}">


            <div class="container" style="padding-top: 15%; padding-left: 17%;">

                <h2>Dobrodošli,</h2>
                <br>
                <h3>
                    Da biste nastavili
                    <a href="${pageContext.request.contextPath}/login" style="color: lightgreen;font-size: 30px;"><b>prijavite se</b>!</a>
                </h3>
            </div>

        </c:if>

    </body>
</html>
