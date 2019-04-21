<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 06.01.2019
  Time: 14:32
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

    <br/>
    <div id="accordion" style="width: 60%;">
        <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                    <button class="btn btn-link" data-toggle="collapse" data-target="#animal" aria-expanded="true"
                            aria-controls="collapseOne">
                        Nowe zwierzę
                    </button>
                </h5>
            </div>
            <div id="animal" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                <div class="card-body">
                    <form:form modelAttribute="animal" action="/pet/add" enctype="multipart/form-data">
                    Pola wymagane
                    <br/>
                    <div class="form-group">
                        <form:input path="name" cssClass="form-control" placeholder="Nazwa"
                                    autofocus="true" cssErrorClass="form-control is-invalid"/>
                    </div>
                    <form:errors path="name" cssStyle="color:red"/>

                    <div class="form-group">
                        <form:textarea rows="10" cols="10" path="description" cssClass="form-control"
                                       placeholder="Opis" cssErrorClass="form-control is-invalid"/>
                    </div>
                    <form:errors path="description" cssStyle="color:red"/>

                    <div class="form-group">
                        <form:input path="price" cssClass="form-control"
                                    placeholder="Cena" cssErrorClass="form-control is-invalid"/>
                    </div>
                    <form:errors path="price" cssStyle="color:red"/>


                    <form:input type="hidden" path="amount" value="1"/>
                    <div class="form-group">
                        <form:input path="age" cssClass="form-control"
                                    placeholder="Wiek" cssErrorClass="form-control is-invalid"/>
                    </div>
                    <form:errors path="age" cssStyle="color:red"/>

                    <form:input type="hidden" path="deleted" value="false"/>
                    <br/>
                    <div class="form-group"><label for="type.id">Rodzaj</label><form:select path="type.id"
                                                                                            cssClass="form-control">
                        <form:options items="${item_types}" itemLabel="category" itemValue="id"/>
                    </form:select>
                        <br/>

                        <div class="form-group"><input type="file" name="multipartFile"/></div>
                        <div class="form-group"><input type="file" name="multipartFile"/></div>
                        <div class="form-group"><input type="file" name="multipartFile"/></div>

                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <input type="submit" class="btn btn-lg btn-primary btn-block" value="Dodaj"/>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                            </div>
                        </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingTwo">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#feed"
                                aria-expanded="false" aria-controls="collapseTwo">
                            Nowy pokarm
                        </button>
                    </h5>
                </div>
                <div id="feed" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                    <div class="card-body">
                        <form:form modelAttribute="feed" action="/feed/add" enctype="multipart/form-data">
                        Pola wymagane
                        <div class="form-group">
                            <form:errors path="name" cssClass="alert alert-danger" element="div"/>
                        </div>
                        <form:errors path="name" cssStyle="color:red"/>

                        <div class="form-group">
                            <form:input path="name" cssClass="form-control" placeholder="Nazwa"
                                        autofocus="true" cssErrorClass="form-control is-invalid"/>
                        </div>
                        <form:errors path="name" cssStyle="color:red"/>

                        <div class="form-group">
                            <form:textarea rows="10" cols="10" path="description" cssClass="form-control"
                                           placeholder="Opis" cssErrorClass="form-control is-invalid"/>
                        </div>
                        <form:errors path="name" cssStyle="color:red"/>

                        <div class="form-group">
                            <form:input path="price" cssClass="form-control"
                                        placeholder="Cena" cssErrorClass="form-control is-invalid"/>
                        </div>
                        <form:errors path="price" cssStyle="color:red"/>


                        <div class="form-group">
                            <form:input path="amount" cssClass="form-control"
                                        placeholder="Ilość sztuk" cssErrorClass="form-control is-invalid"/>
                        </div>
                        <form:errors path="amount" cssStyle="color:red"/>
                        <br/>

                        <form:input type="hidden" path="deleted" value="false"/>
                        <div class="form-group">
                            <form:input path="gram" cssClass="form-control"
                                        placeholder="Gramatura" cssErrorClass="form-control is-invalid"/>
                        </div>
                        <form:errors path="gram" cssStyle="color:red"/>
                        <br/>

                        <div class="form-group"><label for="type.id">Rodzaj</label><form:select path="type.id"
                                                                                                cssClass="form-control">
                            <form:options items="${item_types}" itemLabel="category" itemValue="id"/>
                        </form:select>
                            <br/>

                            <div class="form-group"><input type="file" name="multipartFile"/></div>
                            <div class="form-group"><input type="file" name="multipartFile"/></div>
                            <div class="form-group"><input type="file" name="multipartFile"/></div>
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                    <input type="submit" class="btn btn-lg btn-primary btn-block" value="Dodaj"/>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6">
                                </div>
                            </div>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingThree">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#accessory"
                                    aria-expanded="false" aria-controls="collapseThree">
                                Nowe akcesorium
                            </button>
                        </h5>
                    </div>
                    <div id="accessory" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                        <div class="card-body">
                            <form:form modelAttribute="accessory" action="/accessory/add" enctype="multipart/form-data">
                            Pola wymagane
                            <div class="form-group">
                                <form:errors path="name" cssClass="alert alert-danger" element="div"/>
                            </div>
                            <form:errors path="name" cssStyle="color:red"/>

                            <div class="form-group">
                                <form:input path="name" cssClass="form-control" placeholder="Nazwa"
                                            autofocus="true" cssErrorClass="form-control is-invalid"/>
                            </div>
                            <form:errors path="name" cssStyle="color:red"/>

                            <div class="form-group">
                                <form:textarea rows="10" cols="10" path="description" cssClass="form-control"
                                               placeholder="Opis" cssErrorClass="form-control is-invalid"/>
                            </div>
                            <form:errors path="name" cssStyle="color:red"/>

                            <div class="form-group">
                                <form:input path="price" cssClass="form-control"
                                            placeholder="Cena" cssErrorClass="form-control is-invalid"/>
                            </div>
                            <form:errors path="price" cssStyle="color:red"/>

                            <form:input type="hidden" path="deleted" value="false"/>
                            <div class="form-group">
                                <form:input path="brand" cssClass="form-control"
                                            placeholder="Marka" cssErrorClass="form-control is-invalid"/>
                            </div>
                            <form:errors path="brand" cssStyle="color:red"/>
                            <br/>

                            <div class="form-group">
                                <form:input path="amount" cssClass="form-control"
                                            placeholder="Ilość sztuk" cssErrorClass="form-control is-invalid"/>
                            </div>
                            <form:errors path="amount" cssStyle="color:red"/>
                            <br/>

                            <div class="form-group"><label for="type.id">Rodzaj</label><form:select path="type.id"
                                                                                                    cssClass="form-control">
                                <form:options items="${item_types}" itemLabel="category" itemValue="id"/>
                            </form:select>
                                <br/>
                                <div class="form-group"><input type="file" name="multipartFile"/></div>
                                <div class="form-group"><input type="file" name="multipartFile"/></div>
                                <div class="form-group"><input type="file" name="multipartFile"/></div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <input type="submit" class="btn btn-lg btn-primary btn-block"
                                               value="Dodaj"/>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                    </div>
                                </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">ID zamówienia</th>
            <th scope="col">Imię i nazwisko</th>
            <th scope="col">Adres</th>
            <th scope="col">Nr telefonu</th>
            <th scope="col">Przedmioty</th>
            <th scope="col">Ilość sztuk</th>
            <th scope="col">Status</th>
            <th scope="col">Anuluj</th>
        </tr>
        </thead>
        <tbody>


        <c:forEach var="orders_list" items="${orders}">

        <c:forEach var="orr" items="${orders_list}">

        <td scope="row">${orr.orderId}</td>
        <td>${orr.user.address.name} ${orr.user.address.surname}</td>
        <td> ${orr.user.address.city} ${orr.user.address.postcode}
                ${orr.user.address.street} ${orr.user.address.house_number}</td>
        <td>${orr.user.address.phoneNumber}</td>
        <td>${orr.item.name}</td>
        <td><fmt:formatNumber type="number" value="${orr.amount}"/></td>
        <td><a href="/status/${orr.orderId.intValue()}">
            <c:if test="${orr.orderType.orderStatus == 'ORDER_ORDERED'}">
                <p class="text-danger font-weight-bold">Zamówiono</p>
            </c:if>
            <c:if test="${orr.orderType.orderStatus == 'ORDER_COMPLETED'}">
                <p class="text-success font-weight-bold">Zrealizowano</p>
            </c:if>

            <c:if test="${orr.orderType.orderStatus == 'ORDER_CANCELED'}">
                <p class="text-warning font-weight-bold">Anulowano</p>
            </c:if>
        </a></td>
        <td><c:if test="${orr.orderType.orderStatus != 'ORDER_CANCELED'}"><a
                href="/cancel/${orr.orderId.intValue()}?us=1">Anuluj</a>
        </c:if></td>
        </tbody>

        </c:forEach>
        <tr>
            <td></td>
        </tr>
        </c:forEach>
    </table>
</div>
<br/>
<jsp:include page="shared/footer.jsp"/>
</body>
</html>
