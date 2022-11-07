<%
  String usuario = request.getParameter("usuario");
  String contrasena = request.getParameter("contrasenna");
  
  if (usuario.equals("jose") && contrasena.equals("1234")) {
    session.setAttribute("usuario", usuario);
    response.sendRedirect("pagPrincipal.jsp");
  } else {
    session.setAttribute("error", "Usuario o contraseña incorrecto");
    response.sendRedirect("index.jsp");
  }
%>
