<%-- 
    Document   : index
    Created on : 27-dic-2015, 17:54:13
    Author     : Diegaker
--%>

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
                            <a id="nombreUser" href="index.jsp" class="botones dropdown-toggle" data-toggle="dropdown">ACCEDE <b class="caret"></b></a>
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
                            <form role="form">
                                <div class="form-group">
                                    <label>Destino</label>
                                    <div>Selecciona barrio de destino:</div>
                                    <select class="form-control" id="barrio">
                                        <option>El Ensanche</option>
                                        <option>Lakua-Arriaga</option>
                                        <option>Zabalgana</option>
                                    </select>
                                </div>
                                <label>Fechas</label>
                                <div class="input-group form-group">
                                    <input type="text" class="form-control" name="date" id="date" data-select="datepicker" placeholder="Llegada">
                                    <span class="input-group-btn"><button type="button" class="btn btn-primary" data-toggle="datepicker"><i class="glyphicon glyphicon-calendar"></i></button></span>
                                </div>
                                <div class="input-group form-group">
                                    <input type="text" class="form-control" name="date" id="date" data-select="datepicker" placeholder="Salida">
                                    <span class="input-group-btn"><button type="button" class="btn btn-primary" data-toggle="datepicker"><i class="glyphicon glyphicon-calendar"></i></button></span>
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
