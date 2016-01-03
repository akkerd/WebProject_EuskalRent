<%--
    Document   : busqueda
    Created on : 29-dic-2015, 17:39:29
    Author     : joseba
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="Modelo.Entidades.Usuario"%>
<%@page import="Modelo.Entidades.Alquiler"%>
<%@page import="Modelo.Listas.ListaAlquileres"%>
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
        <div class="jumbotron">
             <div  id="contenedorJumbotron" class="container-fluid">
                 <div id="inputRegistro" class="center-block">
                    <h3 class="center">Lista de alojamientos disponibles</h3>
                    <div id="lista-alojamientos">
                        <div class="panel-group">
                            <%ListaAlquileres ls;
                                ls = (ListaAlquileres)request.getSession().getAttribute("listaAlquileres");
                                ArrayList<Alquiler> al = ls.getAlquileres();
                                Iterator<Alquiler> it = al.iterator();
                               
                                int count = 0;
                                while(it.hasNext())
                                {
                                    count++;
                                    Alquiler alq = it.next();
                                    String titulo = alq.getTitulo();
                                    String direccion = alq.getAlojamiento().getDireccion();
                                    float precio = alq.getAlojamiento().getPrecioNoche();
                                %>
                                <div class="panel panel-primary">
                                    <div class="panel-heading"><%=titulo%></div>
                                    <h5>Dirección: <%=direccion%></h5>
                                    <h5>Precio: <%=precio%> €/noche</h5>
                                    <a href="verAlojamiento.jsp"><button type="button" id="botonFormPerfil" class="btn btn-default center-block">Reservar</button></a>
                                </div>
                            <%
                                }
                            %>
                           
 
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
        <script src="js/main.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>