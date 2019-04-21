<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 06.01.2019
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sklep zoologiczny</title>
</head>
<body>
<jsp:include page="shared/header.jsp"/>
<div class="container">
    <c:if test="${!empty orders}">
        <c:forEach var="orders_list" items="${orders}">

            <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">ID zamówienia</th>
                <th scope="col">Imię i nazwisko</th>
                <th scope="col">Adres</th>
                <th scope="col">Nr telefonu</th>
                <th scope="col">Przedmioty</th>
                <th scope="col">Status</th>
                <th scope="col">Anuluj</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="orr" items="${orders_list}">
                <td scope="row">${orr.orderId}</td>
                <td>${orr.user.address.name} ${orr.user.address.surname}</td>
                <td> ${orr.user.address.city} ${orr.user.address.postcode}
                        ${orr.user.address.street} ${orr.user.address.house_number}</td>
                <td>${orr.user.address.phoneNumber}</td>
                <td>${orr.item.name}</td>
                <td>
                    <c:if test="${orr.orderType.orderStatus == 'ORDER_ORDERED'}">
                        <p class="text-danger font-weight-bold">Zamówiono</p>
                    </c:if>
                    <c:if test="${orr.orderType.orderStatus == 'ORDER_COMPLETED'}">
                        <p class="text-success font-weight-bold">Zrealizowano</p>
                    </c:if>

                    <c:if test="${orr.orderType.orderStatus == 'ORDER_CANCELED'}">
                        <p class="text-warning font-weight-bold">Anulowano</p>
                    </c:if>
                </td>
                <td><c:if test="${orr.orderType.orderStatus == 'ORDER_ORDERED'}"><a
                        href="/cancel/${orr.orderId.intValue()}?us=0">Anuluj</a>
                </c:if>
                </td>
                </tbody>

            </c:forEach>

        </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty orders}">
        Brak
    </c:if>
</div>
<jsp:include page="shared/footer.jsp"/>
</body>
</html>
