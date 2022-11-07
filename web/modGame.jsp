<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>Modificar Juego</title>
    </head>

    <style>
        body {background-image: url("magic_circuit.jpg");
              background-size: cover;}

        @font-face {font-family: 'CenturyGothic';
                    src: url("Century_Gothic.ttf")}

    </style>
    <body style="font-family: 'CenturyGothic';">
        <% request.setCharacterEncoding("UTF-8");%>
        <div class="container">
            <br><br>
            <div class="panel panel-info">
                <div class="panel-heading text-center">Modificación de juego</div>
                <form method="get" action="addGameMod.jsp">
                    <div class="form-group"> 
                        <label>&nbsp;&nbsp;ID del juego:&nbsp;</label><input type="text" size="11" name="juegoID" value="<%= request.getParameter("juegoID")%>" readonly>
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Nombre del juego:&nbsp;</label><input type="text" size="100" name="nombre" value="<%= request.getParameter("nomJuego")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Número de la entrega:&nbsp;</label><input type="text" size="" name="numero" value="<%= request.getParameter("numJuego")%>">
                        <label>&nbsp;&nbsp;Saga:&nbsp;</label><input type="text" size="25" name="saga" value="<%= request.getParameter("sagaJuego")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Género:&nbsp;</label><input type="text" name="genero" size="20" value="<%= request.getParameter("genreJuego")%>">
                    </div>
                    <hr>
                    &nbsp;&nbsp;<a href="pagPrincipal.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
                    <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
                </form>


                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="js/jquery.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
                </body>
                </html>
