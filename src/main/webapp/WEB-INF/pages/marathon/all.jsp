<%-- 
    Document   : new
    Created on : 12-Jul-2020, 16:51:44
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:bundle basename="i18n/config">
            <title><fmt:message key="searchMarathon.infoMessage"/></title>
        </fmt:bundle>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap/4.4.1/css/bootstrap.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/bootstrap-table/1.16.0/dist/bootstrap-table.min.css'>
        <link rel='stylesheet' href='${pageContext.request.contextPath}/webjars/font-awesome/5.6.3/css/all.min.css'>

        <style>
            .btn-holder{
                text-align: center;
            }
            .btnNadji{
                color:lightgreen;
            }
            .btnNadji:hover{
                background-color:#6C757D ;
                color: lightgreen;
            }
            .btnView{
                color:lightgreen;
            }
            .btnView:hover{
                background-color:lightgreen;
                color:black ;
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
            .pageNavigation{
                text-align: center;
                color:#6C757D;
                font-size: 20px;

            }

            .pageNavigation a{
                color:black;
            }
            .pageNavigation a:hover{
                color:lightgreen;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%@include file="../template/menu.jsp" %>

        <fmt:bundle basename="i18n/config">

            <div class="container"  style='margin-top:8%;'>

                <h2><fmt:message key="searchMarathon.infoMessage"/></h2>
                <hr>
                <c:if test="${not empty mmStatus}">
                    <div class="alert alert-success" role="alert">

                        ${mmStatus}
                    </div>

                </c:if>
                <form method="GET" action="${pageContext.request.contextPath}/mm/find/1">
                    <div class="row">
                        <div class="form-group col-sm-4">
                            <label for="name"><fmt:message key="label.marathon.name"/></label>
                            <input type="text" name="name" value="${param.name}" class="form-control"/>
                        </div>

                        <div class="form-group col-sm-4">
                            <label for="dateTime"><fmt:message key="label.dateTime"/> </label>
                            <input name="dateTime" value="${param.dateTime}" class="form-control"/>
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="movie"><fmt:message key="label.movie"/> </label>
                            <input name="movie.name" value="${param.movie.name}" class="form-control"/>
                        </div>

                    </div>
                    <div class="btn-holder">
                        <input type="submit" class="btn btnNadji btn-dark" value="<fmt:message key="button.searchMarathon"/>"/>
                    </div>
                </form>
                <hr style="padding-bottom: 3%;">

                <h2><fmt:message key="search.Result"/></h2>
                <hr>

                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th><fmt:message key="label.marathon.id"/></th>
                            <th><fmt:message key="label.marathon.name"/></th>
                            <th><fmt:message key="label.user"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach
                            items="${marathons}"
                            var="marathon"
                            varStatus="loop">
                            <tr>
                                <td>${marathon.id}</td>
                                <td>${marathon.name}</td>
                                <td>${marathon.user.username}</td>
                                <td>

                                    <a class="btn btnView" href="<c:url value = "/mm/${marathon.id}/view/">
                                       </c:url>">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z"/>
                                        <path fill-rule="evenodd" d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                        </svg>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="pageNavigation">
                    <c:forEach begin="1" end="${totalPages}" step="1" var="i">
                        <c:if test="${currentPage!=i}">
                            <c:if test="${empty paramValues}">
                                <a  href="${pageContext.request.contextPath}/mm/all/${i}">
                                    <c:out value = "${i}"/>
                                </c:if>
                                <c:if test="${not empty paramValues}">
                                    <a  href="${pageContext.request.contextPath}/mm/find/${i}?name=${param.name}&dateTime=${param.dateTime}&movie.name=${param.movie.name}">
                                        <c:out value = "${i}"/>
                                    </c:if>
                                </a>
                            </c:if>
                            <c:if test="${currentPage==i}">
                                <u><c:out value = "${i}"/></u>
                                </c:if>
                            </c:forEach>
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
