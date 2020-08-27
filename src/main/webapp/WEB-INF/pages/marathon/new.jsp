<%-- 
    Document   : new
    Created on : 18-Jul-2020, 08:52:11
    Author     : root
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <title><fmt:message key="newMarathon.infoMessage"/></title>
        </fmt:bundle>  
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>

        <style>
            .linkAdd{
                background-color: lightgray;

            }
            .linkAdd:hover{
                text-decoration: none;
                background-color:  #6C757D;
                color: white;
            }
            body{
                padding-bottom: 5%;
            }
            .container {
                background-color: #f2f2f2;
                padding: 5px 20px 15px 20px;
                border: 1px solid lightgrey;
                border-radius: 3px;
            }
             .error{
               color: crimson;
            }
        </style>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>
        <fmt:bundle basename="i18n/config">
            <div class="container"  style='margin-top:8%;'>
                <h2><fmt:message key="newMarathon.infoMessage"/></h2>
                <hr>


                <br> <h3><fmt:message key="label.addedShowtimes"/></h3>
                ${mmMessage}
                <br><hr>
                <br>
                <c:if test="${empty mm.showtimes}">
                    <a class="btn btn-dark" href="<c:url value = "/showtime/all/1" >
                       </c:url>"><fmt:message key="label.addToMarathon"/></a>
                </c:if>
                <br>
                <c:if test="${not empty mm.showtimes}">
                    <table class="table table-dark" id='table1'>
                        <thead>
                            <tr>
                                <th><fmt:message key="label.showtimeId"/></th>
                                <th><fmt:message key="label.dateTime"/></th>
                                <th><fmt:message key="label.movie"/></th>
                                <th><fmt:message key="label.Hall"/></th>
                                <th><fmt:message key="label.action"/></th>
                            </tr>
                        </thead>
                        <tbody path>
                            <c:forEach
                                items="${mm.showtimes}"
                                var="showtime"
                                varStatus="loop">
                                <tr id="${showtime.id}">
                                    <td>${showtime.id}</td>
                                    <fmt:formatDate value="${showtime.dateTime}" pattern="yyyy-MM-dd HH:mm" var="myDate" />
                                    <td>${myDate}</td>
                                    <td>${showtime.movie}</td>
                                    <td>${showtime.hall}</td>
                                    <td><a class="linkAdd btn" href="<c:url value = "/mm/removeShowtime/${showtime.id}" >
                                           </c:url>"><fmt:message key="label.removeShowtime"/></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <br>
                <div>
                    <form:form action="${pageContext.request.contextPath}/mm/save" method="POST" modelAttribute="movieMarathon">
                        <div class="form-group">
                            <label for="name"><fmt:message key="label.marathon.name"/> </label>
                            <div class="col-sm-6">
                                <form:input path="name" class="form-control"/>
                               <div class="col-sm-6 error">
                                <form:errors path="name" ></form:errors> 
                               </div>
                                </div>
                            </div>
                            <input type="submit" value="<fmt:message key="button.saveMarathon"/>" class="btn btn-outline-dark " style="background-color:lightgreen;" />
                    </form:form>
                </div>
            </div>

        </fmt:bundle>

        <%@include file="/WEB-INF/pages/template/footer.jsp" %>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/popper.js/1.16.0/umd/popper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.js"></script>
    </body>
</html>