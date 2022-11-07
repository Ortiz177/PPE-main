<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <title>Iniciar sesión</title>
    </head>

    <style>
        body {background-image: url(magic_circuit.jpg);
              background-size: cover;}

        @font-face {font-family: 'CenturyGothic';
                    src: url("Century_Gothic.ttf")}
        </style>

        <body style="font-family: 'CenturyGothic'; color: white;">
        <%
            if (session.getAttribute("usuario") != null) {
                response.sendRedirect("pagPrincipal.jsp");
            }
        %>



        <!-- Default form subscription -->
        <form class="text-center p-5" action="login.jsp">

            <p class="h4 mb-4 text-light">Login</p>

            <!-- Name -->
            <input type="text" id="defaultSubscriptionFormPassword" class="form-control mb-4" name="usuario" placeholder="Username">

            <!-- Email -->
            <input type="password" id="defaultSubscriptionFormEmail" class="form-control mb-4" name="contrasenna" placeholder="Password">

            <!-- Sign in button -->
            <button class="btn btn-info btn-block" type="submit">Sign in</button>


        </form>
        <!-- Default form subscription -->


        <div style="color: red;">
            <p>
                <%=session.getAttribute("error") == null
                        ? "" : session.getAttribute("error")%>
                <% session.removeAttribute("error");%>
            </p>
        </div>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>