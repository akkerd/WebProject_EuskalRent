<%-- 
    Document   : prueba
    Created on : 22-dic-2015, 21:06:19
    Author     : Asierph
--%>

<%@page import="Modelo.Entidades.Usuario"%>
<%@page import="Modelo.conexionBD.ConexionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ConexionBD conexion = ConexionBD.getConexionBD();
            Usuario user = conexion.buscarUsuario("asmartinez@ehu.eus","pass1");
            if ( user != null){
            %>
            <h1><%=user.getNombreCompleto()%></h1>
            <% } else {%>
            <h1>No existe el usuario</h1>
            <% }%>
    </body>
</html>
