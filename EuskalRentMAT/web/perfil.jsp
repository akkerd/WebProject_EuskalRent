<%-- 
    Document   : perfil
    Created on : 28-dic-2015, 16:52:27
    Author     : Diegaker
--%>

<%@page import="Modelo.Entidades.Usuario"%>
<%@page import="Modelo.Entidades.Alquiler"%>
<%@page import="Modelo.Listas.ListaAlquileres"%>
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
        <title>EuskalRent</title>
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
                    <a id="logo" class="navbar-brand" href="index.jsp"><img id="imgLogo" src="img/logo.png"></a>
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
               </div>
            </div>
        </nav><!-- /navbar -->   
           <!-- MENÚS DEL PERFIL -->
           <div class="jumbotron"> 
               <div  id="contenedorJumbotron" class="container-fluid" >                   
                   
                    <ul class="nav nav-menus">                 
                         <li  class="btn-toolbar"  >
                             <a id="perfil"  aria-expanded="false" class="dropdown-toggle confPerfil" data-toggle="dropdown">Configuración de Perfil</a>    
                         </li>
                         <li class="btn-toolbar" >
                             <a id="reservas" aria-expanded="false"  class="dropdown-toggle" data-toggle="dropdown">Gestionar Reservas</a>
                         </li>

                         <li class="btn-toolbar" >
                             <a id="alojamiento" aria-expanded="false"  class="dropdown-toggle" data-toggle="dropdown">Gestionar Alojamientos</a>
                         </li>
                     </ul> 
             

                    <div class="cambiable">
                        <div id="gPerfil">
                            <div id="inputRegistro" class="center-block">
                                <h3 class="center">Modifica los datos de tu perfil</h3>
                                    <form role="form" name="registro">
                                        <div class="form-group">
                                            <label for="nombre">*Nombre:</label>
                                            <input type="text" pattern="[A-Za-z ,.'-]{3,}" maxlength="20" id="nombre-perfil" class="form-control input-registro" required >
                                            <span class="span-registro" id="span-nombre"> </span>
                                        </div>
                                        <div class="form-group">
                                           <label for="apellidos">Apellidos:</label>
                                           <input type="text" id="apellidos-perfil" class="form-control input-registro" >
                                           <span class="span-registro" > </span>
                                       </div>
                                       <div class="form-group">
                                           <label for="tel">*Teléfono:</label>
                                           <input type="tel" pattern="[9|6|7][0-9]{8}"  id="tel-perfil" class="form-control input-registro" required>
                                           <span class="span-registro" id="span-tel"> </span>
                                       </div>
                                       <div class="form-group">
                                           <label for="email">*Email:</label>
                                           <input type="email" class="form-control input-registro" id="email-perfil" required>
                                           <span class="span-registro" id="span-email"> </span>
                                       </div>
                                       <div class="form-group">
                                           <label for="pwd">*Contraseña:</label>
                                           <input type="password" id="pwd-perfil" class="form-control input-registro"  required>
                                           <span class="span-registro"> </span>
                                       </div>
                                        <div class="form-group">
                                           <label for="pwd2">*Comprobar contraseña:</label>
                                           <input type="password" id="pwd2-perfil" class="form-control input-registro" required>
                                           <span class="span-registro" id="span-pwd2"> </span>
                                        </div>
                                        <div class="center-block dnd" id="drop-zone" draggable="true">   </div>
                                        <button type="submit" id="formulario-cambio" class="btn btn-default">Modificar datos</button>
                                    </form> 
                            </div>
                        </div>
                            
                        <div id="gReservas">
                            <div id="inputRegistro" class="center-block">
                                <h3  class="center" >Gestiona tus reservas</h3>
                                <h1>RESERVAS!!!</h1>
                            </div>
                        </div>
                        <div id="gAlojamientos">
                            <!--<h3>Mostrar aquí lista de alojamientos. Si se clika uno de ellos, lleva a la pagina "modificarAlojamiento". Posteriormente se podría implementar un botón de "eliminarAlojamiento"</h3>-->
                            <%
                                Usuario usuario1 = (Usuario)request.getSession().getAttribute("usuario");
                                if (usuario1 != null){
                                    ListaAlquileres listaAlqui = usuario1.getListaAlquileres();
                                    if ( listaAlqui.getNumeroAlquileres() == 0 ){
                                        %> <script>alert("Mostrar formulario de registro alojamiento");</script> <%
                                    }else{
                                        %> <script>alert("Mostrar lista alojamientos");</script> <%
                                    }
                                }
                            %>
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
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
