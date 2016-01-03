<%-- 
    Document   : perfil
    Created on : 26-dic-2015, 20:26:11
    Author     : joseba
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Listas.ListaAlquileres"%>
<%@page import="Modelo.Listas.ListaReservas"%>
<%@page import="Modelo.Entidades.Usuario"%>

<%@page import="Modelo.Entidades.Alquiler"%>
<%@page import="Modelo.Entidades.Reserva"%>
<%@page import="Modelo.conexionBD.ConexionBD"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- METADATOS -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EuskalRent</title>
        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/datepicker.min.css" rel="stylesheet">
        <link href="css/style.css"  rel="stylesheet">
    </head>
    <body>
        <!-- Navegador -->
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container-fluid">
                <div class="navbar-header">
                   <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                   </button>
                    <a id="logo" class="navbar-left" href="index.jsp"><img id="imgLogo" src="img/logo.png"></a>
                </div>
                   <!-- Navegador superior -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">               
                    <ul class="nav navbar-nav navbar-right">                
                        <li id="menuCambiable" class="dropdown">
                            <% String text;
                            Usuario usuario = null;
                            // Si entra aqui quiere decir que el usuario no esta loged
                                if (request.getSession().getAttribute("usuario") == null){
                                    text = "ACCEDE";
                                    %>
                                    <ul  id="borrableLogearse" class="dropdown-menu" style="padding: 15px;min-width: 250px;">
                                        <li>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <form action="logear" method="post" role="form" id="login-nav">
                                                        <div class="form-group">
                                                            <label class="sr-only" for="email" >E-mail</label>
                                                            <input name="email" id="loginEmail" class="form-control formLogin" type="email" placeholder="Correo electronico" required>
                                                            <span class="span-registro" id="avisoEmailLogin"></span>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="sr-only" for="contraseña" >Contraseña</label>
                                                            <input name="pass" id="loginPass" class="form-control formLogin" type="password" placeholder="Contraeña" required>
                                                            <span class="span-registro" id="avisoPassLogin"></span>
                                                        </div>
                                                        <div class="form-group">
                                                            <button id="accede" type="submit" class="btn btn-success btn-block">ACCEDE</button>
                                                            <span class="span-registro" id="noExiste"></span>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a class="btn btn-primary btn-block" href="registro.jsp">REGISTRO</a>
                                        </li>
                                    </ul>
                                    <%
                                } else {
                                    // si entra aqui el usuario esta loged.
                                     usuario = (Usuario)request.getSession().getAttribute("usuario");                                    
                                    text = usuario.getNombreCompleto();
                                    %>
                                    
                                    <ul id="borrableUsuario" class="dropdown-menu" style="padding: 15px;min-width: 250px;">
                                        <li><a href="perfil.jsp">Tu perfil</a></li>
                                        <li><a id="logout" href="<%=request.getContextPath()%>/logout" >Logout</a></li>
                                    </ul>

                               <% }%>
                               <a id="nombreUser" href="#" class="botones dropdown-toggle" data-toggle="dropdown"><%=text%><b class="caret"></b></a>

                        </li>
                    </ul>
                        <ul class="nav navbar-nav navbar-right">
                        <li id="menuCambiable">
                            <a id="registroAlojamiento" href="registroAlojamiento.jsp" class="botones ">Registra tu alojamiento</a>
                        </li>  
                    </ul>  
               </div>
            </div>
        </nav><!-- /navbar --> 
           <!-- MENÚS DEL PERFIL -->
           <div class="jumbotron"> 
               <div  id="contenedorJumbotron" class="container-fluid" >                   
                   
                    <ul class="nav nav-menus">                 
                         <li  class="btn-toolbar"  >
                             <a id="perfil"  aria-expanded="false" href="" class="dropdown-toggle confPerfil" data-toggle="dropdown">Gestionar Perfil</a>    
                         </li>
                         <li class="btn-toolbar" >
                             <a id="reservas" aria-expanded="false" href="" class="dropdown-toggle" data-toggle="dropdown">Gestionar Reservas</a>
                         </li>

                         <li class="btn-toolbar" >
                             <a id="alojamiento" aria-expanded="false" href="#" class="dropdown-toggle" data-toggle="dropdown">Gestionar Alojamientos</a>
                         </li>
                     </ul> 
             
                   <%
                   String nombre = usuario.getNombreCompleto();
                   int tel = usuario.getTelefono();
                   String email = usuario.getEmail();
                   %>
                    <div class="cambiable">
                        <div id="gPerfil">
                            <div id="inputRegistro" class="center-block">
                                <h3 class="center">Modifica los datos de tu perfil</h3>
                                    <form role="form" name="registro">
                                        <div class="form-group">
                                            <label for="nombre">*Nombre completo:</label>
                                            <input type="text" name="nombre-perfil" value="<%=nombre%>"pattern="[A-Za-z ,.'-]{3,}" maxlength="20" id="nombre-perfil" class="form-control input-registro" required >
                                            <span class="span-registro" id="span-nombre"> </span>
                                        </div>
                                       <div class="form-group">
                                           <label for="tel">*Teléfono:</label>
                                           <input type="tel" name="tel-perfil" value="<%=tel%>" pattern="[9|6|7][0-9]{8}"  id="tel-perfil" class="form-control input-registro" required>
                                           <span class="span-registro" id="span-tel"> </span>
                                       </div>
                                       <div class="form-group">
                                           <label for="email">*Email:</label>
                                           <input type="email" name="email-perfil" value="<%=email%>" class="form-control input-registro" id="email-perfil" required>
                                           <span class="span-registro" id="span-email"> </span>
                                       </div>
                                       <div class="form-group">
                                           <label for="pwd">*Contraseña:</label>
                                           <input type="password" name="pwd-perfil" id="pwd-perfil" class="form-control input-registro"  required>
                                           <span class="span-registro"> </span>
                                       </div>
                                        <div class="form-group">
                                           <label for="pwd2">*Comprobar contraseña:</label>
                                           <input type="password" id="pwd2-perfil" class="form-control input-registro" required>
                                           <span class="span-registro" id="span-pwd2"> </span>
                                        </div>
                                        <label for="pwd2">Foto de perfil:</label>
                                        <div class="center-block dnd" name="foto-perfil" id="drop-zone" draggable="true">   </div>
                                        <button type="submit" id="formulario-cambio" class="btn btn-default">Modificar datos</button>
                                    </form> 
                            </div>
                        </div>
                            
                        <div id="gReservas" >
                            <div id="inputRegistro" class="center-block">
                                <h3  class="center" >Gestiona tus reservas</h3>
                                <div id="arrendador">
                                    <h2>como arrendador</h2>
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Reserva</th>
                                            <th>Fecha Reserva</th>
                                            <th>Fecha Entrada</th>
                                            <th>Fecha Salida</th>
                                            <th>Acción</th>
                                        </tr>
                                        <%
                                        if(usuario != null){
                                            
                                            ConexionBD conexion = ConexionBD.getConexionBD();
                                            ListaReservas ls = conexion.getListaReservasPorAlquileres(usuario.getIdUsuario());
                                            ArrayList<Reserva> al = ls.getReservas();
                                            Iterator<Reserva> it = al.iterator();
                                            
                                            while(it.hasNext()){
                                                  Reserva alq = it.next();
                                                String fA = String.format("%1$td-%1$tm-%1$tY", alq.getFechaReserva());
                                                String fI = String.format("%1$td-%1$tm-%1$tY", alq.getFechaEntrada());
                                                String fF = String.format("%1$td-%1$tm-%1$tY", alq.getFechaSalida());
                                                %><tr>
                                                    <td>titulo</td>
                                                    <td><%=fA%></td>
                                                    <td><%=fI%></td>
                                                    <td><%=fF%></td>
                                                    <td><button class="btn-link">cancelar</button><button class="btn-link">modificar</button></td>
                                                <tr><%
                                                
                                            }
                                            
                                        %>
                                       
                                    </table>
                                </div>
                                <div id="arrendatario">
                                    <h2>como arrendatario</h2>
                                    <table class="table table-striped">
                                        <tr>
                                                <th>Reserva</th>
                                                <th>Fecha Reserva</th>
                                                <th>Fecha Entrada</th>
                                                <th>Fecha Salida</th>
                                                <th>Acción</th>
                                        </tr>
                                         <%
                                           
                                            ListaReservas lsr = usuario.getListaReservas();
                                            ArrayList<Reserva> alr = lsr.getReservas();
                                            Iterator<Reserva> itr = alr.iterator();
                                            
                                            while(itr.hasNext()){
                                                Reserva rs = itr.next();
                                                String fRR = String.format("%1$td-%1$tm-%1$tY", rs.getFechaReserva());
                                                String fRI = String.format("%1$td-%1$tm-%1$tY", rs.getFechaEntrada());
                                                String fRF = String.format("%1$td-%1$tm-%1$tY", rs.getFechaSalida());
                                                %><tr>
                                                    <td>titulo</td>
                                                    <td><%=fRR%></td>
                                                    <td><%=fRI%></td>
                                                    <td><%=fRF%></td>
                                                    <td><button class="btn-link">cancelar</button><button class="btn-link">modificar</button></td>
                                                <tr><%
                                                
                                            }
                                            }
                                        %>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div id="gAlojamientos" >
                            <div id="inputRegistro" class="center-block">
                                <div class="row">
                                    <table class="table table-striped">
                                                <tr>
                                                    <th>Titulo</th>
                                                    <th>Dirección</th>
                                                    <th>Precio/noche</th>
                                                    <!--<th>Foto</th>/-->
                                                </tr>
                                            <%
                                                ListaAlquileres lal = usuario.getListaAlquileres();
                                                ArrayList<Alquiler> alq = lal.getAlquileres();
                                                Iterator<Alquiler> ital = alq.iterator();
                                                
                                                while(ital.hasNext()){
                                                    Alquiler alquiler = ital.next();
                                                    String titu = alquiler.getTitulo();
                                                    String direc = alquiler.getAlojamiento().getDireccion();
                                                    float precioAl = alquiler.getAlojamiento().getPrecioNoche();
                                                    //String foto = alquiler.getAlojamiento().getFotoAlojamiento();
                                                    
                                                %><tr>
                                                    <td><%=titu%></td>
                                                    <td><%=direc%></td>
                                                    <td><%=precioAl%></td>
                                                    <!--<td>%=foto%</td>/-->
                                                <tr><%
                                                }
                                            %>
                                    </table>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
            
        <footer class="footer">
            <div class="container">
                <p class="text-muted textoFooter center-block">EuskalRent - Joseba Alonso, Diego Tobarra y Asier Martinez</p>
            </div>
        </footer>
        <!-- JS -->
        
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="http://maps.google.com/maps/api/js?sensor=false" language="javascript" type="text/javascript"></script>
        <script src="js/loadGeolocation.js" type="text/javascript"></script> 
        <script src="js/main.js" type="text/javascript"></script> 
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>