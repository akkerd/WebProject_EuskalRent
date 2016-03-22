<%-- 
    Document   : modificarReserva
    Created on : 05-ene-2016, 0:32:48
    Author     : joseba
--%>


<%@page import="java.util.*"%>
<%@page import="Modelo.Entidades.Usuario"%>
<%@page import="Modelo.Entidades.Alquiler"%>
<%@page import="Modelo.Entidades.Reserva"%>
<%@page import="Modelo.Listas.ListaReservas"%>
<%@page import="Modelo.conexionBD.ConexionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- METADATOS -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registra tu alojamiento</title>
        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <link href="css/css-Joseba.css"  rel="stylesheet">
    </head>
    <body>
        <%
            ConexionBD conexion = ConexionBD.getConexionBD();
        %>
            
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
                                <a id="nombreUser" href="#" class="botones dropdown-toggle" data-toggle="dropdown"><%=text%><b class="caret"></b></a>
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
                                        <li><a href="perfil.jsp">Tu perfil</a></li>
                                        <li><a href="#">Tu saldo: <%=usuario.getSaldo() %>€</a></li>
                                        <li><a id="logout" href="<%=request.getContextPath()%>/logout" >Logout</a></li>
                                    </ul>
                                     <a id="nombreUser" href="#" class="botones dropdown-toggle" data-toggle="dropdown"><img class=" img-perfil img-circle" src="img/perfil/<%=fotoPerfil%>"><%=text%><b class="caret"></b></a>
                               <% }%>
                               

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
                <%
                    Reserva reserva = (Reserva) request.getSession().getAttribute("reserva");
                    int idReserva = reserva.getIdReserva();
                    Alquiler alquiler = conexion.getAlquilerDeReserva(idReserva);
                    
                    
                    String titulo = alquiler.getTitulo();
                    String tipoAloj = alquiler.getAlojamiento().getTipoAlojamiento();
                    int numMax = alquiler.getAlojamiento().getNumHuespedes();
                    String barrio = alquiler.getAlojamiento().getBarrio();
                    float tarifa = alquiler.getAlojamiento().getPrecioNoche();
                    String direccion = alquiler.getAlojamiento().getDireccion();
                    String comentario = alquiler.getAlojamiento().getComentario();
                    String politica = alquiler.getAlojamiento().getTipoCancelacion();
                    
                    Date fechaFinalq = alquiler.getFechaFin();
                    
                    Date fechaEntrada = (Date) request.getSession().getAttribute("fechaEntrada");
                    Date fechaSalida = (Date) request.getSession().getAttribute("fechaSalida");
                    Date fechaReserva = reserva.getFechaReserva();
                    request.getSession().setAttribute("fechaReserva", fechaReserva);
                    
                    
                    
                %>
                <br>
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 name="titulo"  id="titulo"><%=titulo%></h3></div>
                    <div class="panel-body">
                        <img src="img/a1.jpg" class="col-md-4 img-thumbnail" alt="foto" width="304" height="236">
                        <!--<div class="col-md-4" id="drop-zone" name="drop-zone" draggable="false"></div>-->
                        <div class="col-md-8">
                            
                            
                            <label>Tipo de alojamiento:</label>
                            <div name="tipoAloj"  id="tipoAloj" class="form-control"><%=tipoAloj%></div>

                            <label for="nHuesp">Número máximo de husepedes:</label>
                            <div name="nHuesp" id="nHuesp" class="form-control"><%=numMax%></div>

                            <label>Barrio</label>
                            <div id="barrio" name="barrio" class="form-control"><%=barrio%></div>
                              
                            <label>Tárifa por noche ( €/noche):</label>
                            <div id="tarifa" name="tarifa" class="form-control"><%=tarifa%></div>
                            
                            <label>Localización: </label>
                            <div id="direccion" name="direccion" class="form-control"><%=direccion%></div> 
                            <div class="map" id="map"></div>
                            
                            <label>Comentarios sobre el piso:</label>
                            <div name="coment"  id="coment" class="form-control"><%=comentario%></div>
                                
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    
                            <%
                                if(usuario != null)
                                {
                                    
                                    %>
                               <form class="form" role="form" action="updateReserva" method="post" accept-charset="UTF-8">
                                    <div class="col-md-4">
                                        <label>Fechas en las que se puede alquilar:</label>
                                        <div class="input-group form-group">
                                            <%
                                                 String dia = null;
                                                    String mes = null;
                                                    Calendar c = Calendar.getInstance();
                                                    if(c.get(Calendar.DATE) < 10){
                                                        dia = "0"+Integer.toString(c.get(Calendar.DATE));
                                                    }
                                                    if (c.get(Calendar.MONTH) < 10){
                                                        mes = "0"+ Integer.toString(c.get(Calendar.MONTH)+1);
                                                    }
                                                    else{
                                                        dia = Integer.toString(c.get(Calendar.DATE));
                                                        mes = Integer.toString(c.get(Calendar.MONTH)+1);
                                                    }
                                                    String año = Integer.toString(c.get(Calendar.YEAR));
                                                    
                                            %>
                                            <input type="date"  class="form-control" value="<%=fechaEntrada%>" min="<%=año+"-"+mes+"-"+dia%>" name="fechaEntrada" id="date-llegada">    
                                        </div>
                                        <div class="input-group form-group">
                                            <input type="date" class="form-control" value="<%=fechaSalida%>" min="" max="<%=fechaFinalq%>" name="fechaSalida" id="date-salida">
                                        </div>  
                                    </div>
                                    <div class="col-md-4"></div>
                                    <div class="center-block col-md-4">
                                        <label>Este alojamiento tiene política de cancelación del tipo:</label>
                                        <div id="politica" name="politica" class="form-control"><%=politica%></div>
                                        <div>Para consultar como funcionan las políticas de cancelación <a href="politicas.jsp">haz click aquí</a>.</div>
                                    </div>
                                    <div class="col-md-12">
                                        <%
                                        
                                        int idAlquiler = alquiler.getIdAlquiler();
                                        request.getSession().setAttribute("usuario", usuario);
                                       
                                        %>
                                        
                                         <input type="hidden" name="idReserva" value="<%=idReserva%>">
                                        <input type="hidden" name="idAlquiler" value="<%=idAlquiler%>">
                                        <button id="botonFormPerfil" type="submit" class="btn btn-primary center-block">Modificar reservar</button>
                                        
                                    </div>
                                </form>
                                    <%
                                }
                                else{
                                    %><form method="post" action="login.jsp"><button type="submit" class="center-block btn-danger">Necesita estar logueado para realizar una reserva</button></form><%
                                }
                            %>
                       
                    
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
        <script src="js/main.js" type="text/javascript"></script> 
        <script src="js/loadGeolocationReserva.js" type="text/javascript"></script>
        <script src="js/datepicker.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Validar formulario -->
    </body>
</html>
