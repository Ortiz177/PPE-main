<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>Listado Videojuegos</title>
    </head>


    <style>
        body {background-image: url("magic_circuit.jpg");
              background-size: cover;
        }

        @font-face {font-family: 'CenturyGothic';
                    src: url("Century_Gothic.ttf")}

    </style>

    <body>
        <div class="container">
            <br><br>			
            <div class="panel panel-info">
                <div class="panel-heading text-center" style="font-family: 'CenturyGothic'; "><h2>VIDEOJUEGOS PENDIENTES</h2></div>

                <%
                    if (session.getAttribute("usuario") == null) {
                %>
                <a href="index.jsp">Entrar</a>
                <%
                } else {
                %>
                Logueado como <%= session.getAttribute("usuario")%></a>
                (<a href="logout.jsp">logout</a>)
                <%
                    }
                %>


                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/videojuegos", "root", "");
                    Statement s = conexion.createStatement();

                    ResultSet listado = s.executeQuery("SELECT * FROM videojuego");
                %>

                <table class="table table-striped" style="font-family: 'CenturyGothic'; background-color: lightblue;">
                    <tr><th>ID</th><th>Nombre</th><th>Numero</th><th>Saga</th><th>Género</th></tr>
                    <form method="get" action="addGame.jsp">
                        <tr><td><input type="text" name="juegoID" size="11"></td>
                            <td><input type="text" name="nomJuego" size="50"></td>
                            <td><input type="text" name="numJuego" size="5"></td>
                            <td><input type="text" name="sagaJuego" size="20"></td>
                            <td><input type="text" name="genreJuego" size="20"></td>

                            <td><button type="submit" value="Añadir" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td><td></td></tr>           
                    </form>


                    <%
                        while (listado.next()) {
                            out.println("<tr><td>");
                            out.println(listado.getString("juegoID") + "</td>");
                            out.println("<td>" + listado.getString("nomJuego") + "</td>");
                            out.println("<td>" + listado.getString("numJuego") + "</td>");
                            out.println("<td>" + listado.getString("sagaJuego") + "</td>");
                            out.println("<td>" + listado.getString("genreJuego") + "</td>");

                    %>
                    <td>
                        <form method="get" action="modGame.jsp">
                            <input type="hidden" name="juegoID" value="<%=listado.getString("juegoID")%>">
                            <input type="hidden" name="nomJuego" value="<%=listado.getString("nomJuego")%>">
                            <input type="hidden" name="numJuego" value="<%=listado.getString("numJuego")%>">
                            <input type="hidden" name="sagaJuego" value="<%=listado.getString("sagaJuego")%>">
                            <input type="hidden" name="genreJuego" value="<%=listado.getString("genreJuego")%>">
                            <button type="submit"  class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
                        </form>
                    </td>

                    <td>
                        <form method="get" action="deleteGame.jsp">
                            <input type="hidden" name="juegoID" value="<%=listado.getString("juegoID")%>"/>
                            <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                        </form>
                    </td></tr>

                    <%
                        } // while   

                        conexion.close();
                    %>

                </table>
                <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
                <script src="js/jquery.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
                </body>
                </html>