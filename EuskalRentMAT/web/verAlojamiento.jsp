<%-- 
    Document   : verAlojamiento
    Created on : 02-ene-2016, 19:21:57
    Author     : Diegaker
--%>
<%@page import="java.util.*"%>
<%@page import="Modelo.Entidades.Usuario"%>
<%@page import="Modelo.Entidades.Alquiler"%>
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
                                    <a id="nombreUser" href="#" class="botones dropdown-toggle" data-toggle="dropdown"><b class="caret"></b></a>

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
                    Alquiler alquiler = (Alquiler)request.getSession().getAttribute("alquiler");
                    String titulo = alquiler.getTitulo();
                    String tipoAloj = alquiler.getAlojamiento().getTipoAlojamiento();
                    int numMax = alquiler.getAlojamiento().getNumHuespedes();
                    String barrio = alquiler.getAlojamiento().getBarrio();
                    float tarifa = alquiler.getAlojamiento().getPrecioNoche();
                    String direccion = alquiler.getAlojamiento().getDireccion();
                    String comentario = alquiler.getAlojamiento().getComentario();
                    String politica = alquiler.getAlojamiento().getTipoCancelacion();
                    String fotoAlq = alquiler.getAlojamiento().getFotoAlojamiento();
                    java.util.Date fechaFin = alquiler.getFechaFin();
                    
                    String fotoAloj = alquiler.getAlojamiento().getFotoAlojamiento();
                    if(fotoAloj.equalsIgnoreCase("null"))
                    {
                        fotoAloj = "sinFoto.jpg";
                    }
                %>
                <br>
                <div class="panel panel-primary">
                    <div class="panel-heading"><h3 name="titulo"  id="titulo"><%=titulo%></h3></div>
                    <div class="panel-body">
                        <div class="col-md-4">
                            <div class="center-block ">
                                <img src="img/alojamientos/<%=fotoAlq%>" class="col-md-12 img-thumbnail" alt="foto" >
                            </div>
                            
                            <hr>
                            <%
                            usuario = (Usuario)request.getSession().getAttribute("usuario"); //Este usuario no es el correto, es el q esta logeado
                            
                            String arrendador = usuario.getNombreCompleto();
                            int tel = usuario.getTelefono();
                            String email = usuario.getEmail();
                            String fotoArr = usuario.getFotoPerfil();
                            if(fotoArr.equalsIgnoreCase("null"))
                            {
                                fotoArr = "sinFoto.jpg";
                            }
                            
                            %>
                            <div class="center-block well">
                                <label>Arrendador:</label>
                                <div name="arrendador"  id="arrendador" class="form-control"><%=arrendador%></div>
                                <label>Teléfono de contacto:</label>
                                <div name="tlfArrendador"  id="tlfArrendador" class="form-control"><%=tel%></div>
                                <label>Email de contacto:</label>
                                <div name="fotoArrendador"  id="fotoArrendador" class="form-control"><%=email%></div>
                                <br>
                                <label>Foto arrendador:</label>
                                <div>
                                    <img src="<%="img/perfil/"+fotoArr%>" class="col-md-4 img-thumbnail" alt="foto" >
                                </div>
                            </div>
                        </div>
                        
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
                            
                            <label>Descripción del alojamiento:</label>
                            <div name="coment"  id="coment" class="text-center"><%=comentario%></div>
                                
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    
                            <%
                                if(usuario != null)
                                {
                                    float saldo = usuario.getSaldo();
                                    Date dateEntrada = (Date)request.getSession().getAttribute("fechaEntrada");
                                    Date dateSalida = (Date) request.getSession().getAttribute("fechaSalida");
                                    boolean conDinero = alquiler.comprobarSaldo(dateEntrada, dateSalida, saldo);
                                    if(conDinero == false){
                                        %><p class="center-block alert-danger center"> No dispone de suficiente dinero para reservar este alojamiento, pruebe a añadir dinero a su cuenta.</p><%
                                    }
                                    else{
                                    /*request.getSession().setAttribute("fechaEntrada", dateEntrada);
                                    request.getSession().setAttribute("fechaEntrada", dateSalida);*/
                                    %>
                               <form class="form" role="form" action="registroReserva" method="post" accept-charset="UTF-8">
                                    <div class="col-md-4">
                                        
                                        <div class="form-group">
                                            <label for="nHuesp">Número máximo de husepedes:</label>
                                            <input type="number" name="nHuesp" min="1" max="<%=numMax%>"  id="nHuesp" class="form-control" required>
                                            <span class="span-registro" id="span-nHuesp"> </span>
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
                                        request.getSession().setAttribute("usuario", usuario);
                                        request.getSession().setAttribute("alquiler", alquiler);
                                        
                                        %>
                                        
                                        
                                        <button id="botonFormPerfil" type="submit" class="btn btn-primary center-block">Reservar</button>
                                        
                                    </div>
                                </form>
                                    <%}
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
        <script src="js/main.js" type="text/javascript"></script>
        <script src="http://maps.google.com/maps/api/js?sensor=false" language="javascript" type="text/javascript"></script>
        <script src="js/loadGeolocation.js" type="text/javascript"></script>
        <script src="js/datepicker.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Validar formulario -->
    </body>
</html>