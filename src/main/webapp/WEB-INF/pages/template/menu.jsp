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
  
</style>


<div class="container">

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <!-- Brand -->
        <a class="navbar-brand" href="#" style="color: lightgreen">Bioskop</a>

        <!-- Links -->
        <ul class="navbar-nav ml-auto">
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
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/showtime/new">Kreiraj projekciju</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/showtime/all">Pretraga projekcija</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Rezervacija
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/new">Kreiraj rezervaciju</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/reservation/all">Pretraga rezervacija</a>
                </div>
            </li>

            <!-- Dropdown -->
            <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Profil
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Odjavi se</a>
                </div>
            </li>

        </ul>
    </nav>    
    <div style="background-color:lightgreen;color:black;text-align:  right;">
        Prijavljeni ste kao: ${sessionScope.user.username}</div>

</div>
