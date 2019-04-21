<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 03.01.2019
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sklep zoologiczny</title>
</head>
<body>
<jsp:include page="shared/header.jsp"/>

<security:authorize access="isAuthenticated()">
    <jsp:forward page="/"/>
</security:authorize>
<br/>
<div class="center">
    <div class="col-xs-12">
        <form action="/login" method="post">
            <c:if test="${param.error != null}">
                <p>
                    Nieprawidłowy login lub hasło.
                </p>
            </c:if>
            <c:if test="${param.logout != null}">
                <p>
                    Zostałeś wylogowany.
                </p>
            </c:if>
            <div class="md-form">
                <label for="username">Nazwa użytkownika</label>
                <input type="text" id="username" name="username" class="form-control"/>
            </div>
            <div class="md-form">
                <label for="password">Hasło</label>
                <input type="password" id="password" name="password" class="form-control"/>
            </div>
            <div class="form-group">
                <security:csrfInput/>
                <button type="submit" class="btn btn-success">Zaloguj</button>
            </div>
        </form>
    </div>
</div>
<br/>
<jsp:include page="shared/footer.jsp"/>
</body>
</html>
