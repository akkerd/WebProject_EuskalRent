<%-- 
    Document   : index
    Created on : 26-dic-2015, 18:19:27
    Author     : joseba
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
                                                            <input name="pass" id="loginPass" class="form-control formLogin" type="pass" placeholder="Contraeña" required>
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
           <div class="jumbotron"> 
               <div class="container-fluid">                   
                    <div class="row">
                        <div id="CarouselContenedor" class="col-md-3">
                            <div id="Carousel" class="carousel slide">
                            <ol class="carousel-indicators">
                                <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#Carousel" data-slide-to="1"></li>
                                <li data-target="#Carousel" data-slide-to="2"></li>
                              </ol>
                              <!-- Carousel items -->
                              <div class="carousel-inner">
                                <div class="active item"><img class="ImgCarousel" src="img/a1.jpg" alt="a1" /></div>
                                <div class="item"><img class="ImgCarousel" src="img/a2.jpg" alt="a2" /></div>
                                <div class="item"><img class="ImgCarousel" src="img/a3.jpg" alt="a3" /></div>
                              </div>
                              <!-- Carousel nav -->
                              <a class="carousel-control left" href="#Carousel" data-slide="prev">&lsaquo;</a>
                              <a class="carousel-control right" href="#Carousel" data-slide="next">&rsaquo;</a>
                          </div>                      
                        </div>
                        <div class="col-md-6">
                            <h3 id="tituloBuscador" class="center-block">¡Busca tu alojamiento ahora mismo!</h3>
                            <form role="form" action="busqueda.jsp">
                                <div class="form-group">
                                    <label>Destino</label>
                                    <input type="text" class="form-control" id="exampleInputEmail2" placeholder="Barrio" required>
                                </div>
                                <label>Fechas</label>
                                <div class="input-group form-group">
                                    <%
                                        Calendar c = Calendar.getInstance();
                                        String dia = Integer.toString(c.get(Calendar.DATE));
                                        String mes = Integer.toString(c.get(Calendar.MONTH)+1);
                                        String año = Integer.toString(c.get(Calendar.YEAR));
                                    %>
                                    <input type="date"  class="form-control" min="<%=año+"-"+mes+"-"+dia%>" name="date" id="date-llegada">
                                    
                                </div>
                                <div class="input-group form-group">
                                    <input type="date" class="form-control" min="" name="date" id="date-salida">
                                    
                                </div>
                                <button id="botonBuscar" type="submit" class="btn btn-default center-block">Buscar</button>
                            </form>
                        </div>
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

