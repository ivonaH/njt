<%-- 
    Document   : header
    Created on : 12-Jul-2020, 16:22:35
    Author     : root
--%>


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
        .navbar{
            margin-bottom: 3%;
        }

    </style>



<nav class="navbar navbar-expand-sm bg-dark navbar-dark" >
    <!-- Brand -->
    <a class="navbar-brand" href="#" style="color: lightgreen;padding-left:14%; font-size: 25px;">Bioskop</a>
    <c:if test="${not empty sessionScope.user}">

        <!-- Links -->
        <ul class="navbar-nav ml-auto" ;">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/home">Pocetna strana</a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Film
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/movie/new">Kreiraj film</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/movie/all">Pretraga filmova</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Projekcija
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/showtime/newS">Kreiraj projekciju</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/showtime/all">Pretraga projekcija</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Rezervacija
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/newR">Kreiraj rezervaciju</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/all">Pretraga rezervacija</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Filmski maraton
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/mm/new">Kreiraj maraton</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/mm/all">Pretraga maratona</a>
                </div>
            </li>

            <!-- Dropdown -->
            <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown" style="color:lightgreen;">
                    Prijavljeni ste kao: ${sessionScope.user.username}
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Odjavi se</a>
                </div>
            </li>

        </ul>

    </c:if>
</nav>    


