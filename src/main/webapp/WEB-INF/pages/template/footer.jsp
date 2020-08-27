<%-- 
    Document   : footer
    Created on : 14-Aug-2020, 15:42:04
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <style>


            .footer {
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
                background-color: lightgreen;
                color: black;
                text-align: center;
                font-size: 15px;
                padding-top: 1%;

            }
            .float{
                position:fixed;
                width:180px;
                height:140px;
                bottom:150px;
                right:100px;
                color:#FFF;
                border-radius:30px;
                text-align:center;
                box-shadow: 2px 2px 3px #999;
                padding-top: 18px;
                border-style:inset;
                border-color: lightgray;

            }
            .float:hover{
                text-decoration: none;
                color: lavenderblush;

            }
            .my-float{
                margin-top:18px;
            }
            .my-float:hover{
                margin-top:18px;
                text-decoration: none;
            }
            .fly-img{
                position:fixed;
                width:60px;
                height:60px;
                bottom:190px;
                right:53px;
                background-color:lightgreen;
                color:#FFF;
                border-radius:40%;
                text-align:center;
                box-shadow: 2px 2px 3px #999;
                text-decoration: none;
                padding: 1%;
            }
        </style>
    </head>

    <body>
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <c:if test="${not empty sessionScope.mm.showtimes}">
                <c:if test = "${not fn:contains(pageContext.request.requestURI, '/marathon/new')}">

                    <a class="float bg-dark" href="${pageContext.request.contextPath}/mm/new">
                        <div class='my-float'>
                            <fmt:message key="label.addedShowtimes"/><br>
                            <div style="color:lightgreen">
                                <b>
                                    ${mm.showtimes.size()} <br>
                                </b>
                            </div>
                            <fmt:message key="link.finishMarathon"/>

                        </div>

                        <!--<img src="https://icon-library.com/images/projector-icon-png/projector-icon-png-1.jpg"  class='fly-img'/>-->
                        <div class='fly-img'>
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M10.146 4.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 8l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
                            <path fill-rule="evenodd" d="M2 8a.5.5 0 0 1 .5-.5H13a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8z"/>
                            </svg>
                        </div>
                    </a>
                </c:if>
            </c:if>
        </fmt:bundle>
        <div class="footer">
            <p>Ivona Heldrih - Bioskop 2020</p>
        </div>
    </body>
</html>



