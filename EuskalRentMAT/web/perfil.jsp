<%-- 
    Document   : perfil
    Created on : 26-dic-2015, 20:26:11
    Author     : joseba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Listas.ListaAlquileres"%>
<%@page import="Modelo.Listas.ListaReservas"%>
<%@page import="Modelo.Entidades.Usuario"%>
<%@page import="java.util.*"%>
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
        <link href="css/css-Joseba.css"  rel="stylesheet">
    </head>
    <body style="background-color: #c8e5e3">
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
                                                     <% 
                                                     Boolean failLoged =(Boolean)request.getSession().getAttribute("failLogin");
                                                     if (failLoged != null){
                                                        if(failLoged == true){%>                                                     
                                                            <p style="color: red">Los datos introducidos son invalidos</p>
                                                     <%    
                                                        }
                                                     }
                                                     %>
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
                         <div class="jumbotron"> 
                            <div  id="contenedorJumbotron" class="container-fluid" >
                                <h3>Necesita logearse para acceder a esta seccion</h3>
                                <button><a href="index.jsp">Volver</a></button>
                            </div>
                        </div>
                                    
                                    <%
                                } else {
                                    // si entra aqui el usuario esta loged.
                                     usuario = (Usuario)request.getSession().getAttribute("usuario");                                    
                                    text = usuario.getNombreCompleto();
                                    String fotoPerfil = usuario.getFotoPerfil();
                                    if(fotoPerfil.equalsIgnoreCase("null"))
                                    {
                                        fotoPerfil = "sinFoto.jpg";
                                    }
                                    %>
                                    
                                    <ul id="borrableUsuario" class="dropdown-menu" style="padding: 15px;min-width: 250px;">
                                        
                                        <li><a href="index.jsp">Inicio</a></li>
                                        <li><a href="perfil.jsp">Tu perfil</a></li>
                                        <li><a href="perfil.jsp">Tu saldo:<%=usuario.getSaldo() %>€</a></li>
                                        <li><a id="logout" href="<%=request.getContextPath()%>/logout" >Logout</a></li>
                                    </ul>

                               
                                        <a id="nombreUser" href="#" class="botones dropdown-toggle" data-toggle="dropdown"><img class=" img-perfil img-circle" src="img/perfil/<%=fotoPerfil%>"><%=text%><b class="caret"></b></a>

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
                         <li class="btn-toolbar" >
                             <a id="saldo" aria-expanded="false" href="#" class="dropdown-toggle" data-toggle="dropdown">Añade saldo</a>
                         </li>
                         <li class="btn-toolbar" >
                             <a id="borrado" aria-expanded="false" href="#" class="dropdown-toggle" data-toggle="dropdown">Borrar Cuenta</a>
                         </li>
                     </ul> 
             
                   <%
                   String nombre = usuario.getNombreCompleto();
                   int tel = usuario.getTelefono();
                   String email = usuario.getEmail();
                   String fotoModPerfil = usuario.getFotoPerfil();
                  
                   %>
                    <div class="cambiable">
                        <div id="gPerfil">
                            <div id="inputRegistro" class="center-block">
                                <h3 class="center">Modifica los datos de tu perfil</h3>
                                    <form method="post" role="form" action="updateUser" name="registro">
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
                                           
                                        <%
                                            //if(fotoPerfil == null){
                                        %>
                                        
                                        <div class="form-group"> 
                                            <label>Foto de perfil : </label>

                                            <div id="drop-zone">
                                                <div id="dentroFoto">
                                                    Suelta tu imagen aquí...
                                                </div>
                                            </div>
                                        </div>
                                        <input type="text" name="fotoDrag" id="fotoDrag"/>
                                        <% request.getSession().setAttribute("usuario", usuario); %>
                                        <button type="submit" id="formulario-cambio" class="btn btn-default">Modificar datos</button>
                                    </form> 
                            </div>
                        </div>
                            
                        <div id="gReservas" >
                            
                                <h3  class="center" >Gestiona tus reservas</h3>
                                <div id="arrendador">
                                    <h3 class="titu-gestion-reservas">Como arrendador</h3>
                                    
                                        <%
                                        if(usuario != null){
                                            
                                            ConexionBD conexion = ConexionBD.getConexionBD();
                                            int idUsuario = usuario.getIdUsuario();
                                            ListaReservas ls = conexion.getListaReservasPorAlquileres(idUsuario);
                                            if(ls.getNumeroReservas() > 0){
                                                ArrayList<Reserva> al = ls.getReservas();
                                                Iterator<Reserva> it = al.iterator();

                                                while(it.hasNext()){
                                                      Reserva alq = it.next();
                                                    String fA = String.format("%1$td-%1$tm-%1$tY", alq.getFechaReserva());
                                                    String fI = String.format("%1$td-%1$tm-%1$tY", alq.getFechaEntrada());
                                                    String fF = String.format("%1$td-%1$tm-%1$tY", alq.getFechaSalida());
                                                    int idReserva = alq.getIdReserva();
                                                    Alquiler alqui = conexion.getAlquilerDeReserva(idReserva);
                                                    String titulo = alqui.getTitulo();
                                                    String fotoAlq = alqui.getAlojamiento().getFotoAlojamiento();
                                                
                                                %>
                                                <table class="tabla-pisos table-responsive" align="center">
                                                    <tr class="tabla-tr">
                                                        <th><%=titulo%></th>
                                                        <th>Fecha Reserva</th>
                                                        <th>Fecha Entrada</th>
                                                        <th>Fecha Salida</th>
                                                        <th>Acción</th>
                                                    </tr>
                                                    <tr>
                                                        <td> <img src="img/alojamientos/<%=fotoAlq%>" class="img-table img-rounded"> </td>
                                                        <td><%=fA%></td>
                                                        <td><%=fI%></td>
                                                        <td><%=fF%></td>
                                                        <td><form method="post" action="borrarReservaArrendador"><input type="hidden" name="idUser" value="<%=idUsuario%>"><input type="hidden" name="idReserva" value="<%=idReserva%>" ><input type="submit" value="cancelar" class="btn-danger"></form></td>
                                                    </tr> 
                                                </table><%
                                                
                                                }
                                            } else {%>
                                               <h4 class="titu-gestion-reservas">No dispone de reservas</h4>     
                                           <% 
                                            }
                                            
                                        %>
                                       
                                   
                                </div>
                                <div id="arrendatario">
                                    <h3 class="titu-gestion-reservas">Como arrendatario</h3>
                                         <%
                                           
                                            ListaReservas lsr = usuario.getListaReservas();
                                            if(lsr != null){
                                                ArrayList<Reserva> alr = lsr.getReservas();
                                                Iterator<Reserva> itr = alr.iterator();

                                                while(itr.hasNext()){
                                                    Reserva rs = itr.next();
                                                    String fRR = String.format("%1$td-%1$tm-%1$tY", rs.getFechaReserva());
                                                    String fRI = String.format("%1$td-%1$tm-%1$tY", rs.getFechaEntrada());
                                                    String fRF = String.format("%1$td-%1$tm-%1$tY", rs.getFechaSalida());
                                                    int idReserva = rs.getIdReserva();
                                                    Alquiler alq = conexion.getAlquilerDeReserva(idReserva);
                                                    if(alq != null){
                                                    String titulo = alq.getTitulo();
                                                    request.getSession().setAttribute("reserva",rs);
                                                    Date dateInicio = rs.getFechaEntrada();
                                                    Date dateFin = rs.getFechaSalida();
                                                    request.getSession().setAttribute("fechaEntrada", dateInicio);
                                                    request.getSession().setAttribute("fechaSalida", dateFin);
                                                    String fotoAlq = alq.getAlojamiento().getFotoAlojamiento();
                                                %>
                                                <table class="tabla-pisos table-responsive" align="center">
                                                    <tr class="tabla-tr">
                                                            <th><%=titulo%></th>
                                                            <th>Fecha Reserva</th>
                                                            <th>Fecha Entrada</th>
                                                            <th>Fecha Salida</th>
                                                            <th>Acción</th>
                                                    </tr>
                                                    <tr>
                                                        <td> <img src="img/alojamientos/<%=fotoAlq%>" class="img-table img-rounded"> </td>
                                                        <td><%=fRR%></td>
                                                        <td><%=fRI%></td>
                                                        <td><%=fRF%></td>
                                                        <td><form method="post" action="modificarReserva.jsp"><button class="btn-info">modificar</button></form><br><form action="borrarReservaArrendatario" method="post"><input type="hidden" name="idUser" value="<%=idUsuario%>"><input type="hidden" name="idReserva" value="<%=idReserva%>" ><input type="submit" value="cancelar"   class="btn-danger"></form></td
                                                    </tr>
                                                </table><%
                                                
                                            }
                                                }
                                            } else {%>
                                                <h4 class="titu-gestion-reservas">No dispone de reservas de sus alojamientos</h4> 
                                            <%
                                            }
                                            }
                                        %>
                                    
                                </div>
                            
                        </div>
                        <div id="gAlojamientos" >
                                <div class="row">
                                   <h3 class="titu-gestion-reservas">Esta es la lista de tus alojamientos:</h3>
                                            <%
                                                ListaAlquileres lal = usuario.getListaAlquileres();
                                                ArrayList<Alquiler> alq = lal.getAlquileres();
                                                if(lal.getNumeroAlquileres() > 0){                                                 

                                                    Iterator<Alquiler> ital = alq.iterator();

                                                    while(ital.hasNext()){
                                                        Alquiler alquiler = ital.next();
                                                        String titu = alquiler.getTitulo();
                                                        String direc = alquiler.getAlojamiento().getDireccion();
                                                        float precioAl = alquiler.getAlojamiento().getPrecioNoche();
                                                        
                                                        String fotoAlq = alquiler.getAlojamiento().getFotoAlojamiento();
                                                        
                                                        request.getSession().setAttribute("alquiler", alquiler);
                                                        request.getSession().setAttribute("usuario", usuario);
                                                    %>
                                                 <table class="tabla-pisos table-responsive" align="center">
                                                    <tr class="tabla-tr">
                                                        
                                                        <th><%=titu%></th>
                                                        <th>Dirección</th>
                                                        <th>Precio/noche</th>
                                                        <th>Acción</th>
                                                    </tr>
                                                    <tr>
                                                        <td> <img src="img/alojamientos/<%=fotoAlq%>" class="img-table img-rounded"> </td>
                                                        <td><%=direc%></td>
                                                        <td><%=precioAl%></td>
                                                        <td><form method="post" action="modificarAlojamiento.jsp"> <input type="submit" value="Modificar"   class="btn-info"></form><br><form action="borrarAlquiler"><input type="submit" value="Dar de baja"   class="btn-danger"></form></td>
                                                    </tr>
                                                </table>
                                                <%
                                                }
                                                } else {%>
                                                
                                                <h4 class="titu-gestion-reservas">No dispone de alojamientos en alquiler. </h4>       
                                                <%
                                                }
                                                %>
                               </div>
                        </div>
                               <div id="gSaldo">
                                   <br>
                                   <h3 id="formRegistro" class="center-block">Añade saldo a tu cuenta</h3>  
                                    <div id="inputRegistro" class="center-block">

                                        <form action="addSaldo" role="form" name="registro" method="post">
                                            <div class="form-group">
                                                <label for="email">*Correo de paypal:</label>
                                                <input type="email" name="email" class="form-control formularioRegistro" id="email" required>
                                                <span class="span-registro" id="span-email"> </span>
                                            </div>
                                            <div class="form-group">
                                                <label for="pwd">*Contraseña:</label>
                                                <input type="password" name="pass" id="pwd" class="form-control formularioRegistro"  required>
                                                <span class="span-registro"> </span>
                                            </div>
                                             <div class="form-group">
                                                <label for="pwd2">*Comprobar contraseña:</label>
                                                <input type="password" id="pwd2" class="form-control formularioRegistro" required>
                                                <span class="span-registro" id="span-pwd2"> </span>
                                             </div>
                                             <div class="form-group">
                                                <label for="number">*Saldo que se desea añadir a la cuenta  ( Min = 5, Max = 100 )</label>
                                                <input type="number" class="form-control formularioRegistro" min="5" max="100" name="saldo"  required>
                                            </div>
                                            <button type="submit" id="formulario-registro" class="btn btn-default">Pagar con paypal</button>
                                        </form>   
                                    </div>
                                    <p class="requerido"> Los campos con * son obligatorios.</p>
                                   
                               </div>
                        <div id="gBorrado">
                            <%
                                int idUser = usuario.getIdUsuario();
                            %>
                            <div id="inputRegistro" class="center-block">
                                <h2>¿Seguro que desea dejar EuskalRent?</h2>
                                <p>Si es así, desde EuskalRent le agradecemos el uso de nuestra aplicación y esperamos volver a verle por aquí pronto. Gracias por usar nuestro servicio, esperamos que haya sido de su agrado.</p>
                                <form method="post" action="deleteUser">
                                    <input type="hidden" name="idUsuario" value="<%=idUser%>">
                                    <button type="submit" class="center-block btn btn-danger">Borrar Cuenta</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           <% }%>
            
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

