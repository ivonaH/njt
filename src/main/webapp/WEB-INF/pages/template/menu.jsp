<%-- 
    Document   : header
    Created on : 12-Jul-2020, 16:22:35
    Author     : root
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
    <head>
        <style>
            .dropdown-menu{

                background-color: #6C757D;
            }
            .dropdown-item{
                color:white;
            }
            .dropdown-item:hover{
                background-color:lightgreen;
            }
            .nav-item:hover{
                background-color:#6C757D;
            }
            .nav-item .active:hover{
                background-color: #6C757D;
                color:lightgreen;
            }
            .green {
                color:black;
            }


        </style>
    </head>
    <body>
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">


            <nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
                <!-- Brand -->
                <a class="navbar-brand" href="#" style="color: lightgreen;padding-left:14%; font-size: 35px;">Bioskop</a>
                <c:if test="${not empty sessionScope.user}">

                    <!-- Links -->
                    <ul class="navbar-nav ml-auto" ;">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/home"><fmt:message key="link.HomePage"/></a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                <fmt:message key="link.movie"/>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/movie/new"><fmt:message key="link.newMovie"/></a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/movie/all"><fmt:message key="link.searchMovie"/></a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                <fmt:message key="link.showtime"/>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/showtime/newS"><fmt:message key="link.newShowtime"/></a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/showtime/all"><fmt:message key="link.searchShowtime"/></a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                <fmt:message key="link.reservation"/>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/newR"><fmt:message key="link.newReservation"/></a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/all"><fmt:message key="link.searchReservation"/></a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                <fmt:message key="link.marathon"/>
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/mm/new"><fmt:message key="link.newMarathon"/></a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/mm/all"><fmt:message key="link.searchMarathon"/></a>
                            </div>
                        </li>

                        <!-- Dropdown -->
                        <li class="nav-item dropdown ">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="color:lightgreen;">
                                <fmt:message key="link.loggedAs"/> ${sessionScope.user.username}
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><fmt:message key="link.logout"/></a>
                            </div>
                        </li>

                    </ul>

                </c:if>
            </nav>    

            <nav class="navbar navbar-expand-sm justify-content-end" style="background-color:lightgreen;margin-bottom: 3%;">
                <div class="collapse navbar-collapse flex-grow-0" id="navbarSupportedContent">
                    <ul class="navbar-nav text-right">
                        <li class="nav-item active">
                            <a  class="nav-link active green" href="?sessionLocale=en_US">en_US</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link active green" href="?sessionLocale=sr_RS">sr_RS</a>
                        </li>
                    </ul>
                </div>
            </nav>

        </fmt:bundle>
    </body>