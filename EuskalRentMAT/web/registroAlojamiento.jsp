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
                    <a id="logo" class="navbar-brand" href="#"><img id="imgLogo" src="img/logo.png"></a>
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
        
        <footer class="footer">
            <div class="container">
                <p class="text-muted textoFooter center-block">EuskalRent - Joseba Alonso, Diego Tobarra y Asier Martinez</p>
            </div>
        </footer>
        <!-- JS -->
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/datepicker.min.js"></script>
        <script src="js/main.js" type="text/javascript"></script> 
        <script src="js/bootstrap.min.js"></script>
    </body>
    </body>
</html>
