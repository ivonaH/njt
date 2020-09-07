<%-- 
    Document   : home
    Created on : 15-Jul-2020, 11:41:18
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <title><fmt:message key="link.HomePage"/></title>
        </fmt:bundle>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>


        <style>
            body{
                margin: 0;
                padding: 0;
                font-family: sans-serif;
                /*background: url(../img/pozadina.jpg) no-repeat;*/
                background-size: cover;
            }
            .login-box{
                width: 500px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);

            }
        </style>
    </head>
    <body>

        <%@include file="/WEB-INF/pages/template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">

            <c:if test="${empty sessionScope.user}">
                <div class="container"  style='margin-top:8%;'>

                    <div class="login-box container ">

                        <h2><fmt:message key="label.welcome"/></h2>
                        <br>
                        <h3>
                            <fmt:message key="label.continue"/>
                            <a href="${pageContext.request.contextPath}/login" style="color: lightgreen;font-size: 30px;"><b><fmt:message key="label.loginTxt"/></b></a>
                        </h3>
                    </div>
                </div>

            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <div class="container" style='margin-top:8%;'>
                    <br>
                    <div class="row">

                        <div class="card col-sm-3" style="text-align: center;">
                            <img src="https://cdn2.iconfinder.com/data/icons/interactive-shadow-pack/100/_-8-512.png" class="card-img-top" style="height:50%; width: 80%; display: block;margin-left: auto; margin-right: auto;margin-top: 2%;">
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"> 
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/movie/new"><fmt:message key="link.newMovie"/></a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="${pageContext.request.contextPath}/movie/all/1" class="btn btn-primary"><fmt:message key="link.searchMovie"/></a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="card col-sm-3" >
                            <img src="https://i.pinimg.com/originals/8b/51/68/8b5168873a2cddcdee83c662ea0ed261.png" class="card-img-top" style="height:50%; display: block;margin-left: auto; margin-right: auto;margin-top: 2%;">
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item"> 
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/showtime/newS"><fmt:message key="link.newShowtime"/></a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="${pageContext.request.contextPath}/movie/all/1" class="btn btn-primary"><fmt:message key="link.searchShowtime"/></a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="card col-sm-3">
                            <img src="https://www.qualitylogoproducts.com/images/_icons/icon_blue_person_plus.svg" class="card-img-top" style="height:50%;display: block;margin-left: auto; margin-right: auto;margin-top: 2%;">
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">          
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/reservation/newR"><fmt:message key="link.newReservation"/></a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="${pageContext.request.contextPath}/movie/all/1" class="btn btn-primary"><fmt:message key="link.searchReservation"/></a>

                                    </li>
                                </ul>

                            </div>
                        </div>

                        <div class="card col-sm-3">
                            <img src="data:image/png;base64,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" class="card-img-top" style="height: 50%; width: 80%;display: block;margin-left: auto; margin-right: auto; margin-top: 2%;">
                            <div class="card-body">

                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">                                
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/mm/new"><fmt:message key="link.newMarathon"/></a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="${pageContext.request.contextPath}/movie/all/1" class="btn btn-primary"><fmt:message key="link.searchMarathon"/></a>

                                    </li>
                                </ul>

                            </div>


                        </div>



                    </div>

                </c:if>




            </fmt:bundle>

            <%@include file="/WEB-INF/pages/template/footer.jsp" %>

            <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/popper.js/1.16.0/umd/popper.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.js"></script>
        </div>
    </body>
</html>