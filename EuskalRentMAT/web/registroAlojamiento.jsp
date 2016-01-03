<%-- 
    Document   : registroAlojamiento
    Created on : 26-dic-2015, 22:58:48
    Author     : Diegaker
--%>
<%@page import="java.util.Calendar"%>
<%@page import="Modelo.Entidades.Usuario"%>
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
        <title>EuskalRent</title>
        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/datepicker.min.css" rel="stylesheet">
        <link href="css/style.css"  rel="stylesheet">
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
                                </li>
                            </ul> 
                                <ul class="nav navbar-nav navbar-right">
                                <li id="menuCambiable">
                                    <a id="toIndex" href="index.jsp" class="botones ">Inicio</a>
                                </li>  
                            </ul>
                           </div>
                        </div>
                    </nav><!-- /navbar -->
                    <div class="jumbotron"> 
                        <div  id="contenedorJumbotron" class="container-fluid" > 
                            <p class="requerido">¡Necesitas acceder como <b>usuario registrado</b> para poder registrar tu alojamiento!</p>
                        </div>
                    </div>
                                    <%
                                } else {
                                    // si entra aqui el usuario esta loged.
                                    Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");                                    
                                    text = usuario.getNombreCompleto();
                                    %>
                                    
                                    <ul id="borrableUsuario" class="dropdown-menu" style="padding: 15px;min-width: 250px;">
                                        <li><a href="perfil.jsp">Tu perfil</a></li>
                                        <li><a id="logout" href="<%=request.getContextPath()%>/logout" >Logout</a></li>
                                    </ul>                              
                               <a id="nombreUser" href="#" class="botones dropdown-toggle" data-toggle="dropdown"><%=text%><b class="caret"></b></a>

                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li id="menuCambiable">
                            <a id="toIndex" href="index.jsp" class="botones ">Inicio</a>
                        </li>  
                    </ul>
               </div>
            </div>
        </nav><!-- /navbar -->

        <div class="jumbotorn"> 
            <div  id="contenedorJumbotron" class="container-fluid" >  
                <div class="cambiable">
                <div id="inputRegistro" class="center-block">
                    <div class="row">
                        <h3 class="center">¡Registra tu alojamiento y empieza a ganar dinero!</h3>
                            <div class="col-md-12">
                                <form class="form" action="RegistroAloj" method="post" id="form-registro-alojamiento" role="form"  accept-charset="UTF-8">
                                    <div class="form-group">
                                        <label for="titulo"><span class="requeridoAst">*</span>Titulo del alojamiento:</label>
                                        <input type="text" name="titulo"  id="titulo" class="form-control" required>
                                        <span class="span-registro" id="span-titulo"> </span>
                                    </div>
                                    <div class="form-group">
                                        <label for="sel1"><span class="requeridoAst">*</span>Tipo de alojamiento:</label>
                                        <select class="form-control" name="tipoAloj" id="tipoAloj" required>
                                            <option>Apartamento</option>
                                            <option>Chalet</option>
                                            <option>Duplex</option>
                                            <option>Otro</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="nHuesp"><span class="requeridoAst">*</span>Número máximo de husepedes:</label>
                                        <input type="number" name="nHuesp" min="1" max="10"  id="nHuesp" class="form-control" required>
                                        <span class="span-registro" id="span-nHuesp"> </span>
                                    </div>
                                    <div class="form-group">
                                        <label><span class="requeridoAst">*</span>Barrio</label>
                                        <select class="form-control" id="barrio" name="barrio" required>
                                            <option>El Ensanche</option>
                                            <option>Lakua-Arriaga</option>
                                            <option>Zabalgana</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="politica"><span class="requeridoAst">*</span>Política de cancelación de tu alojamiento (para onsultar como funcionan las políticas de cancelación <a href="politicas.jsp">haz click aquí</a>): </label>
                                        <select class="form-control" id="politica" name="politica" required>
                                            <option>Cancelación Gratuita</option>
                                            <option>Flexible</option>
                                            <option>Estricta</option>
                                        </select>
                                    </div>   
                                    <label>Fechas en las que se podría alquilar:</label>
                                    <h5>(Si lo dejas en blanco significa que pueden reservar cualquier día)</h5>
                                    <div class="input-group form-group">
                                    <%
                                        Calendar c = Calendar.getInstance();
                                        String dia = Integer.toString(c.get(Calendar.DATE));
                                        String mes = Integer.toString(c.get(Calendar.MONTH)+1);
                                        String año = Integer.toString(c.get(Calendar.YEAR));
                                    %>
                                    <input type="date"  class="form-control" min="<%=año+"-"+mes+"-"+dia%>" name="date-inicio" id="date-inicio">
                                    
                                    </div>
                                    <div class="input-group form-group">
                                        <input type="date" class="form-control" min="" name="date-fin" id="date-fin">

                                    </div>
                                    <div class="form-group">
                                        <label for="tarifa">Tárifa por noche ( €/noche):</label>
                                        <input type="text" pattern="[0-9]{1,4}\.[0-9]{1}[0-9]{1}$" id="tarifa" name="tarifa" class="form-control" title="Utiliza un número con dos decimales entre 0.00 y 9999.99" >
                                        <span class="span-registro" id="span-tarifa"> </span>
                                    </div>
                                    <div class="form-group">
                                        <label for="map">Geolocalización: </label><br>
                                        Escribe una dirección: <input type="text" id="buscador" name="buscador" title="Dirección a Geocode" class="Direccion"/>
                                        <input type="button" id="btnBuscador" title="Buscar" value="Busca"/><br><br>
                                        <div class="map" id="map"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="coment">Comentarios sobre el piso:</label>
                                        <textarea type="text" name="coment"  id="coment" class="form-control"></textarea>
                                        <span class="span-registro" id="span-coment"> </span>
                                    </div>
                                    <div class="form-group"> 
                                        <label>Foto de tu alojamiento: </label>
                                        <!--<div class="center-block dnd" id="drop-zone" name="drop-zone" draggable="true">   </div>-->
                                        <div id="drop-zone">
                                            Suelta tu imagen aquí...
                                            <div id="clickHere">
                                                o haz click...
                                                <input type="file" name="file" id="file"/>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                <button id="botonFormPerfil" type="submit" class="btn btn-default center-block">Registrar alojamiento</button>
                            </form>
                        </div>
                        <p class="requerido"> Los campos con * son obligatorios.</p>
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
        <script src="js/main.js" type="text/javascript"></script> 
        <script src="js/loadGeolocation.js" type="text/javascript"></script>
        <script src="js/datepicker.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!--<script src="js/perfil.js" type="text/javascript"></script> -->
        <!-- Validar formulario -->
    </body>
</html>
