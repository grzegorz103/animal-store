<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 27.01.2019
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista użytkowników</title>
</head>
<body>
<jsp:include page="shared/header.jsp"/>

<div class="container">

    <c:if test="${!empty list.content}">

        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">ID użytkownika</th>
                <th scope="col">Nazwa użytkownika</th>
                <th scope="col">E-mail</th>
                <th scope="col">Imię i nazwisko</th>
                <th scope="col">Adres</th>
                <th scope="col">Nr telefonu</th>
                <th scope="col">Status</th>
                <th scope="col">Zmiana</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list.content}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.address.name} ${user.address.surname}</td>
                    <td>${user.address.city} ${user.address.postcode} ${user.address.street} ${user.address.house_number}</td>
                    <td>${user.address.phoneNumber}</td>
                    <td>
                        <c:if test="${user.locked}"><p class="text-danger font-weight-bold">Zablokowany</p></c:if>
                        <c:if test="${!user.locked}"><p class="text-success font-weight-bold">Niezablokowany</p></c:if>
                    </td>
                    <td>
                        <button class="btn blue-gradient" onclick="location.href='/user/edit/${user.id}'">Zmień</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="container" style="width: 60%;">
            <c:set var="page" value="${list}" scope="request"/>
            <c:set var="mainUrl" value="user/list" scope="request"/>
            <jsp:include page="shared/pagination.jsp"/>
        </div>
    </c:if>

    <c:if test="${empty list.content}">
        Brak użytkowników w bazie
    </c:if>
</div>
<jsp:include page="shared/footer.jsp"/>
</body>
</html>
