<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 31.10.2018
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="full-height">
<body>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" type="text/css" href="/css/main.css"/>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.1/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.6.0/js/mdb.min.js"></script>


<nav class="navbar navbar-expand-lg navbar-dark blue-gradient">
    <div class="container">
        <a class="navbar-brand" href="/"><img width="100px" height="auto" src="/images/logo2.png"></a>

        <!-- Przycisk -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
                aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Itemy  -->
        <div class="collapse navbar-collapse" id="basicExampleNav">

            <ul class="navbar-nav mr-auto">
                <!-- Links
                <li class="nav-item active">
                    <a class="nav-link" href="#">Strona główna
                        <span class="sr-only">(current)</span>
                    </a>
                </li> -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/pet/list" data-toggle="dropdown"
                       aria-haspopup="true"
                       aria-expanded="false">Zwierzęta</a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/pet/list">Wszystkie</a>
                        <div class="dropdown-divider"></div>
                        <c:forEach var="type" items="${item_types}">
                            <a class="dropdown-item" href="/pet/cat/${type.id}">${type.category}</a>
                        </c:forEach>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/pet/list" data-toggle="dropdown"
                       aria-haspopup="true"
                       aria-expanded="false">Pokarm</a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/feed/list">Wszystkie</a>
                        <div class="dropdown-divider"></div>
                        <c:forEach var="type" items="${item_types}">
                            <a class="dropdown-item" href="/feed/cat/${type.id}">${type.category}</a>
                        </c:forEach>
                    </div>
                </li>

                <li class=" nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/pet/list" data-toggle="dropdown"
                       aria-haspopup="true"
                       aria-expanded="false">Akcesoria</a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="/accessory/list">Wszystkie</a>
                        <div class="dropdown-divider"></div>
                        <c:forEach var="type" items="${item_types}">
                            <a class="dropdown-item" href="/accessory/acc/${type.id}">${type.category}</a>
                        </c:forEach>
                    </div>
                </li>

                <security:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                           aria-haspopup="true"
                           aria-expanded="false">Panel admina</a>
                        <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/user/summary">Podsumowanie</a>
                            <a class="dropdown-item" href="/user/list">Lista użytkowników</a>
                          </div>
                    </li>
                </security:authorize>
                <!-- Dropdown
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                       aria-haspopup="true"
                       aria-expanded="false">Dropdown</a>
                    <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li> -->
                <security:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/user/cart">Twój koszyk</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/orders">Twoje zamówienia</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/details">Zmień dane</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" onclick="document.getElementById('logout').submit()">Witaj
                            <sec:authentication
                                    property="principal.username"/>, wyloguj się</a></li>
                    <form action="<c:url value="/logout"/>" id="logout" method="post" style="display: none;">

                        <sec:csrfInput/>
                    </form>
                </security:authorize>
                <security:authorize access="isAnonymous()">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/login"/>">Zaloguj się</a></li>

                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/registration"/>">Zarejestruj</a></li>
                </security:authorize>

            </ul>

        </div>
    </div>

</nav>


</body>
</html>