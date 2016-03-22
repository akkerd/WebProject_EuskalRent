<%-- 
    Document   : prueba
    Created on : 22-dic-2015, 21:06:19
    Author     : Asierph
--%>

<%@page import="java.time.temporal.TemporalAccessor"%>
<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Modelo.Entidades.Usuario"%>
<%@page import="Modelo.conexionBD.ConexionBD"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.Listas.ListaAlquileres"%>
<%@page import="Modelo.Entidades.Alquiler"%>
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
            Usuario user = conexion.buscarUsuario("d@d.com","1");
            
            String barrio = "El Ensanche";
            String date1 = "2016-02-10";
            String date2 = "2016-03-10";
            
            
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            
            
            try {

            java.util.Date fecha1 = df.parse(date1);

            java.sql.Date sqlDate1 = new java.sql.Date(fecha1.getTime());
            java.util.Date fecha2 = df.parse(date2);

            java.sql.Date sqlDate2 = new java.sql.Date(fecha2.getTime());

            
            

            %><h1><%=sqlDate1%></h1><h1><%=sqlDate2%></h1><%
            
            
            ListaAlquileres lsr = conexion.getListaAlquileresPorFechaBarrio(sqlDate1, sqlDate2, barrio);
            ArrayList<Alquiler> alr = lsr.getAlquileres();
            Iterator<Alquiler> itr = alr.iterator();
            while(itr.hasNext())
            {
                Alquiler alq = itr.next();
                int id = alq.getIdAlquiler();
                %><h3><%=id%></h3><%
            }
            } catch (Exception ex) {

                ex.printStackTrace();

            }
            if ( user != null){
            %>
            <h1><%=user.getNombreCompleto()%></h1>
            <% } else {%>
            <h1>No existe el usuario</h1>
            <% }%>
    </body>
</html>
