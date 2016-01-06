<%-- 
    Document   : subirImagen
    Created on : 05-ene-2016, 6:13:16
    Author     : Diegaker
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Subir imagen</title>
 </head>
 <body>
 <h1>Subir imagen</h1>
 <form method="post" enctype='multipart/form-data' action="subirImagenServlet">
 Por favor, seleccione fichero a subir<br/>
 <input type="file" name="fichero" /> 
 <input type="submit" />
 </form>
 <%
 if(request.getAttribute("subido")!=null){
 if(request.getAttribute("subido").toString().equals("true")){
 %>
 <p style="color: green">Fichero subido correctamente.</p>
 <%
 if(request.getAttribute("rutaFichero")!=null){
 %>
 <form method="post" action="subirDatosImagenServlet">
 <label>Nombre:</label>
 <input type="text" id="txtNombreImagen" name="nombre">
 <br>
 <label>Ruta: <%=request.getAttribute("rutaFichero")%></label>
 <input type="hidden" id="txtRuta" name="ruta" value="<%=request.getAttribute("rutaFichero")%>">
 <br>
 <label>Descripción:</label>
 <input type="text" id="txtDescripcion" name="descripcion">

 <input type="submit" id="idEnviar" value="Enviar">
 </form>
 <%
 }
 }else{
 %>
 <p style="color: red">Error al subir fichero.</p>
 <%
 }
 }
 if(request.getAttribute("errorInsercion")!=null){
 if(request.getAttribute("errorInsercion").toString().equals("1")){
 %>
 <p style="color: green">Imagen insertada correctamente.</p>
 <%
 }else{
 %>
 <p style="color: red">Error al insertar imagen en la base de datos.</p>
 <%
 }
 }
 %>
 <a href="index.jsp">Volver</a> 

 </body>
</html>
