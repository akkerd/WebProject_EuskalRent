<%-- 
    Document   : modificarAlojamiento
    Created on : 04-ene-2016, 14:10:09
    Author     : joseba
--%>

<%@page import="java.util.Calendar"%>
<%@page import="Modelo.Entidades.Usuario"%>
<%@page import="Modelo.conexionBD.ConexionBD"%>
<%@page import="Modelo.Entidades.Alquiler"%>
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
                                    <%
                                } else {
                                    // si entra aqui el usuario esta loged.
                                    Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");                                    
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
        <%
            Alquiler alquiler = (Alquiler)request.getSession().getAttribute("alquiler");
            String titulo = alquiler.getTitulo();
            String tipoAlojamiento = alquiler.getAlojamiento().getTipoAlojamiento();
            int numMax = alquiler.getAlojamiento().getNumHuespedes();
            String barrio = alquiler.getAlojamiento().getBarrio();
            String politica = alquiler.getAlojamiento().getTipoAlojamiento();
            int idAlquiler = alquiler.getIdAlquiler();
            int idAlojamiento = alquiler.getAlojamiento().getIdAlojamiento();
            
            java.util.Date fechaInicio = alquiler.getFechaInicio();
            java.util.Date fechaFin = alquiler.getFechaFin();
            java.util.Date fechaAlquiler = alquiler.getFechaAlquiler();
            
            float tarifa = alquiler.getAlojamiento().getPrecioNoche();
            String direccion = alquiler.getAlojamiento().getDireccion();
            String comentario = alquiler.getAlojamiento().getComentario();
        %>
        <div class="jumbotron"> 
            <div  id="contenedorJumbotron" class="container-fluid" >  
                <div class="cambiable">
                <div id="inputRegistro" class="center-block">
                    <div class="row">
                        <h3 class="center">Modifique los datos de su alojamiento</h3>
                            <div class="col-md-12">
                                <form class="form" action="updateAloj" method="post" id="form-registro-alojamiento" role="form"  accept-charset="UTF-8">
                                    <div class="form-group">
                                        <label for="titulo"><span class="requeridoAst">*</span>Titulo del alojamiento:</label>
                                        <input type="text" name="titulo"  id="titulo" value="<%=titulo%>" class="form-control" required>
                                        <span class="span-registro" id="span-titulo"> </span>
                                    </div>
                                    <div class="form-group">
                                        <label for="sel1"><span class="requeridoAst">*</span>Tipo de alojamiento:</label>
                                        <select class="form-control" value="<%=tipoAlojamiento%>" name="tipoAloj" id="tipoAloj" required>
                                            <option value="Apartamento">Apartamento</option>
                                            <option value="Chalet">Chalet</option>
                                            <option value="Duplex">Duplex</option>
                                            <option value="Otro">Otro</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="nHuesp"><span class="requeridoAst">*</span>Número máximo de husepedes:</label>
                                        <input type="number" value="<%=numMax%>" name="nHuesp" min="1" max="10"  id="nHuesp" class="form-control" required>
                                        <span class="span-registro" id="span-nHuesp"> </span>
                                    </div>
                                    <div class="form-group">
                                        <label><span class="requeridoAst">*</span>Barrio</label>
                                        <select class="form-control" value="<%=barrio%>" id="barrio" name="barrio" required>
                                            <option value="El Ensanche">El Ensanche</option>
                                            <option value="Lakua-Arriaga">Lakua-Arriaga</option>
                                            <option value="Zabalgana">Zabalgana</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="politica"><span class="requeridoAst">*</span>Política de cancelación de tu alojamiento (para onsultar como funcionan las políticas de cancelación <a href="politicas.html">haz click aquí</a>): </label>
                                        <select class="form-control" value="<%=politica%>" id="politica" name="politica" required>
                                            <option value="Gratuita">Gratuita</option>
                                            <option value="Flexible">Flexible</option>
                                            <option value="Estricta">Estricta</option>
                                        </select>
                                    </div>   
                                    <label>Fechas en las que se podría alquilar:</label>
                                    
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
                                        request.getSession().setAttribute("date-inicio", fechaInicio);
                                        request.getSession().setAttribute("date-fin", fechaFin);
                                        request.getSession().setAttribute("date-alquiler", fechaAlquiler);
                                    %>
                                    <input type="date" required  class="form-control" value="<%=fechaInicio%>" min="<%=año+"-"+mes+"-"+dia%>" name="date-inicio" id="date-llegada">
                                    
                                    </div>
                                    <div class="input-group form-group">
                                        <input type="date" required class="form-control" value="<%=fechaFin%>" min="" name="date-fin" id="date-salida">

                                    </div>
                                    <div class="form-group">
                                        <label for="tarifa">Tárifa por noche ( €/noche):</label>
                                        <input type="text" value="<%=tarifa%>" pattern="[0-9]{1,4}\.[0-9]{1}[0-9]{1}$" id="tarifa" name="tarifa" class="form-control" title="Utiliza un número con dos decimales entre 0.00 y 9999.99" >
                                        <span class="span-registro" id="span-tarifa"> </span>
                                    </div>
                                    <div class="form-group">
                                        <label for="map">Geolocalización: </label><br>
                                        Escribe una dirección: <input type="text" id="buscador" value="<%=direccion%>" name="buscador" title="Dirección a Geocode" class="Direccion"/>
                                        <input type="button" id="btnBuscador" title="Buscar" value="Busca"/><br><br>
                                        <div class="map" id="map"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="coment">Descripción del alojamiento:</label>
                                        <input type="text" value="<%=comentario%>" name="coment"  id="coment" class="form-control">
                                        <span class="span-registro" id="span-coment"> </span>
                                    </div>
                                    <div class="form-group"> 
                                        <label>Foto de tu alojamiento: </label>
                                        <div class="center-block dnd" id="drop-zone" name="drop-zone" draggable="true">   </div>
                                    </div>
                                        <input type="hidden" value="<%=idAlquiler%>" name="idAlquiler">
                                        <input type="hidden" value="<%=idAlojamiento%>" name="idAlojamiento">
                                        <input type="hidden" value="<%=fechaAlquiler%>" name="fechaAlquiler">
                                <button id="botonFormPerfil" type="submit" class="btn btn-default center-block">Modifica el alojamiento</button>
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
        <script src="js/main.js" type="text/javascript"></script> 
        <script src="http://maps.google.com/maps/api/js?sensor=false" language="javascript" type="text/javascript"></script>
        <script src="js/loadGeolocation.js" type="text/javascript"></script>
        <script src="js/datepicker.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!--<script src="js/perfil.js" type="text/javascript"></script> -->
        <!-- Validar formulario -->
    </body>
</html>

