<%-- 
    Document   : login
    Created on : 28-dic-2015, 13:25:45
    Author     : Diegaker
--%>

<%@page import="Modelo.Entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- METADATOS -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/datepicker.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
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
                    <a id="logo" class="navbar-brand" href="#"><img id="imgLogo" src="img/logo.png"></a>
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
                                            <a class="btn btn-primary btn-block" href="registro.html">REGISTRO</a>
                                        </li>
                                    </ul>
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

                               <% }%>
                               <a id="nombreUser" href="#" class="botones dropdown-toggle" data-toggle="dropdown"><%=text%><b class="caret"></b></a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li id="menuCambiable">
                            <a id="registroAlojamiento" href="registroAlojamiento.jsp" class="botones ">Registra tu alojamiento</a>
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
               <div class="container-fluid">   
                            <div class="row">
                                <div class="col-md-12">
                                    <h3 id="formRegistro" class="center-block">¡Logueate con tu cuenta para acceder a TODAS las prestaciones de la web!</h3> 
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
                                            <button id="accede" type="submit" class="btn btn-success center-block">ACCEDE</button>
                                            <span class="span-registro" id="noExiste"></span>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        <div class="divider"></div>
                        <h3 id="formRegistro" class="center-block">¿Aún no estás registrado? ¡Registrate gratis aquí!</h3> 
                        <div>
                            <a href="registro.jsp"> 
                                <button class="btn btn-primary center-block">REGISTRO</button>
                            </a>
                        </div>           
                </div>
            </div>
            <div class="container-fluid">                   
                <div id="info" class="row">
                    <div class="col-md-4">
                        <span class=" glyphicon glyphicon-euro center" aria-hidden="true"></span>
                        <h4 class="center">El mejor precio de todo el mercado.</h4>
                        <p class="center">Descrubre alojamientos que se ajustan a tu presupuesto y necesidades.</p>
                    </div>   
                    <div class="col-md-4">
                        <span class="glyphicon glyphicon-ok center" aria-hidden="true"></span>
                        <h4 class="center">Única y genuina</h4>
                        <p class="center">La mejor aplicación EuskalRent del mercado, rechaza las copias baratas.</p>
                    </div>        
                    <div class="col-md-4">
                        <span class=" glyphicon glyphicon-home center" aria-hidden="true"></span>
                        <h4 class="center">Alojamientos verificados</h4>
                        <p class="center">Todos los alojamientos son comprobados por nuestro equipo de expertos.</p>
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
        <script src="js/main.js" type="text/javascript"></script> 
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

