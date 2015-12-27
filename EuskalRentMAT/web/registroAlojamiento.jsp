<%-- 
    Document   : registroAlojamiento
    Created on : 26-dic-2015, 22:58:48
    Author     : Diegaker
--%>
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
        <title>Registra tu alojamiento</title>
        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            ConexionBD conexion = ConexionBD.getConexionBD();
            Usuario user = conexion.buscarUsuario("asmartinez@ehu.eus","pass1");
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
                    <a id="logo" class="navbar-brand" href="index.html"><img id="imgLogo" src="img/logo.png"></a>
                </div>
                   <!-- Navegador superior -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
                    <ul class="nav navbar-nav navbar-right"> 
                        <li id="menuCambiable" class="dropdown">
                            <a id="nombreUser" href="index.html" class="botones dropdown-toggle" data-toggle="dropdown">ACCEDE <b class="caret"></b></a>
                        </li> 
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li id="menuCambiable">
                            <a id="registroAlojamiento" href="index.html" class="botones ">Inicio</a>
                        </li>  
                    </ul>
               </div>
            </div>
        </nav><!-- /navbar -->

        <div class="jumbotron"> 
            <div  id="contenedorJumbotron" class="container-fluid" >  
                <div id="inputRegistro" class="center-block">
                    <div class="row">
                        <h3 class="center">Registra tu alojamiento aquí: </h3>
                            <div class="col-md-12">
                                <form class="form" role="form" action="#" method="post" accept-charset="UTF-8">
                                    <div class="form-group">
                                        <label for="sel1">Tipo de alojamiento:</label>
                                        <select class="form-control" id="tipoAloj" required>
                                            <option>Apartamento</option>
                                            <option>Chalet</option>
                                            <option>Duplex</option>
                                            <option>Otro</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="nHuesp">Número máximo de husepedes:</label>
                                        <input type="number" name="maxHuespedes" min="1" max="10"  id="nHuesp" class="form-control" required>
                                        <span class="span-registro" id="span-nHuesp"> </span>
                                    </div>
                                    <div class="form-group">
                                        <label>Barrio</label>
                                        <select class="form-control" id="barrio">
                                            <option>El Ensanche</option>
                                            <option>Lakua-Arriaga</option>
                                            <option>Zabalgana</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="politica">Política de cancelación de tu alojamiento (para onsultar como funcionan las políticas de cancelación <a href="politicas.html">haz click aquí</a>): </label>
                                        <select class="form-control" id="politica" required>
                                            <option>Cancelación Gratuita</option>
                                            <option>Flexible</option>
                                            <option>Estricta</option>
                                        </select>
                                    </div>   
                                    <div class="form-group">
                                        <label for="tarif">Tárifa por noche ( €/noche):</label>
                                        <input type="text" pattern="[0-9]{1,4}\.[0-9]{1}[0-9]{1}$" id="tarifa" class="form-control" required title="Utiliza un número con dos decimales entre 0.00 y 9999.99" >
                                        <span class="span-registro" id="span-tarifa"> </span>
                                    </div>
                                    <div class="form-group">
                                        <label for="map">Geolocalización: </label><br>
                                        Escribe una dirección: <input type="text" id="buscador" title="Dirección a Geocode" class="Direccion" required/>
                                        <input type="button" id="btnBuscador" title="Buscar" value="Busca"/><br><br>
                                        <div class="map" id="map"></div>
                                    </div>
                                    <div class="form-group"> 
                                        <label>Foto de tu alojamiento: </label>
                                         <div class="center-block dnd" id="drop-zone2" draggable="true">   </div>
                                    </div>
                                <button id="botonFormPerfil" type="submit" class="btn btn-default center-block">Registrar alojamiento</button>
                            </form>
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
        <script src="js/datepicker.min.js"></script>
        <script src="http://maps.google.com/maps/api/js?sensor=false" language="javascript" type="text/javascript"></script>
        <script src="js/loadGeolocation.js" type="text/javascript"></script> 
        <script src="js/main.js" type="text/javascript"></script> 
        <script src="js/perfil.js" type="text/javascript"></script> 
        <script src="js/dragDrop.js" type="text/javascript"></script> 
        <!-- Validar formulario -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
