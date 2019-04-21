<%--
  Created by IntelliJ IDEA.
  User: Komputer
  Date: 03.01.2019
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sklep zoologiczny</title>
</head>
<body>
<jsp:include page="shared/header.jsp"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <style type="text/css">
        html,
        body,
        header,
        .view {
            height: 100%;
        }

        @media (max-width: 740px) {
            html,
            body,
            header,
            .view {
                height: 1000px;
            }
        }

        @media (min-width: 800px) and (max-width: 850px) {
            html,
            body,
            header,
            .view {
                height: 650px;
            }
        }

        @media (min-width: 800px) and (max-width: 850px) {
            .navbar:not(.top-nav-collapse) {
                background: #1C2331 !important;
            }
        }
    </style>
</head>
<body>
<div class="view full-page-intro"
     style="background-image: url('/images/background.jpg'); background-repeat: no-repeat; background-size: cover;">
    <div class="mask rgba-black-light d-flex justify-content-center align-items-center">
        <div class="container">
            <div class="row wow fadeIn">
                <div class="col-md-6 mb-4 white-text text-center text-md-left">
                    <h1 class="display-4 font-weight-bold">Sklep zoologiczny Kakadu</h1>
                    <hr class="hr-light">
                    <p>
                        <strong>Prawdopodobnie najtańszy sklep zoologiczny w sieci</strong>
                    </p>

                    <p class="mb-4 d-none d-md-block">
                        <strong>W naszym sklepie znajdziesz mnóstwo zwierząt, karm oraz akcesoriów dla zwierząt.
                            Zapraszamy do zakupów.
                    <p class="text-success font-weight-bold">Projekt platformy programowania </p>
                    <p class="text-danger font-weight-bold">Grzegorz Piłat</p></strong>
                    </p>

                    <a target="_blank" href="/registration"
                       class="btn btn-indigo btn-lg">Stwórz nowe konto!
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>


<jsp:include page="shared/footer.jsp"/>
</body>
</html>
