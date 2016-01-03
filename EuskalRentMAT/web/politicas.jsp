<%-- 
    Document   : politicas
    Created on : 03-ene-2016, 0:57:18
    Author     : Diegaker
--%>

<%@page import="Modelo.Entidades.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- METADATOS -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi Perfil-EuskalRent</title>
        <!-- CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/datepicker.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/politicas.css">
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
            <div  id="contenedorJumbotron" class="container-fluid" >  
                <div class="cambiable">
                <div id="inputRegistro" class="center-block">
                    <section class="grid-21 margin-0 margin-25-b pad-20 oflow-auto cancellation-policies border-grey-1">
                         <h3 class="h-light margin-0">1. ¿Cómo funciona una cancelación?</h3>
                         <ul>
                             <li>Las políticas de cancelación son seleccionadas por el proveedor. El proveedor puede elegir una de éstas tres políticas diferentes: flexible, moderada o estricta. Estas políticas están diseñadas para proteger a los proveedores y los arrendatarios.</li>
                             <li> De acuerdo con las condiciones de cancelación, entendemos por cancelación el retiro antes de que la entrada planeada tenga lugar.</li>
                         </ul>
                         <h3 class="h-light margin-0">2. ¿Cómo puedo cancelar una reserva?</h3> 
                         <ul>
                             <li>Para garantizar un proceso fluido y seguro, todas las cancelaciones deben ser procesadas &#8203;&#8203;a través de EuskalRent.</li>
                             <li>Si deseas cancelar una reserva, por favor ponte en contacto con nuestro equipo de Atención al Cliente.</li>
                             <li>Las cancelaciones realizadas por el huésped deben ser comunicadas por escrito. Las cancelaciones deben incluir el código de reserva y deben ser enviadas desde la dirección de correo con la que el usuario está registrado en EuskalRent y que consta en su perfil de usuario.</li>
                             <li>Los anfitriones deben cancelar sus reservas únicamente a través de la página de cancelaciones de EuskalRent, la cual está disponible en "Mis ofertas", en "Mi cuenta". Al cancelar a través de está página, se enviará automáticamente un mensaje al equipo de Atención al Cliente de EuskalRent.</li>
                             <li>Por favor, ten en cuenta que la cancelación no es oficial hasta después de haber recibido un correo electrónico de confirmación de EuskalRent.</li> <li>Nuestro equipo de Atención al Cliente se encargará al momento de tu solicitud de cancelación y de informar a tu proveedor o inquilino. No tendrás que hacer nada más.</li> 
                         </ul>
                            <h3 class="h-light margin-0">3. Si el arrendatario cancela, ¿cómo se calcula el reembolso al inquilino y el pago al proveedor?</h3> <h4 class="h-light">3.1. Reglamento general</h4> <ul> <li>El importe de la devolución al inquilino depende de cuando se cancele la reserva, de la política de cancelación elegida por el proveedor, o impuesta por EuskalRent.</li> <li>Para garantizar un proceso fluido y seguro, todas las cancelaciones deben ser procesadas &#8203;&#8203;a través de EuskalRent.</li> <li>La cantidad reembolsable depende de la política de cancelación. La cantidad correspondiente a la tarifac de cancelación se muestra durante el proceso de reserva. El reglamento de la sección 8.4. con respecto a los procesos de pago se aplicará en consecuencia.</li> <li>Independientemente de la política de cancelación elegida por el proveedor, los mismos inquilinos son los responsables de demostrar que el proveedor no incurre en pérdidas o en una pérdida significativamente menor que la tasa de cancelación.</li> </ul> <h4 class="h-light margin-0">3.2. Políticas individuales de cancelación</h4>
                            <div class="cancellation-policy cancellation-policy-free" id="cancellation-policy-free">
                            <h4 class="margin-0-t">
                            Política de Cancelación:
                            <span class="green">Cancelación Gratuita</span>
                            </h4>
                            <h5>Si cancelas la reserva al menos con 2 días de antelación a la fecha del check-in, antes de las 12 del mediodía, CET (hora central europea), se te reebolsará el importe total (incluyendo la cuota de servicio de EuskalRent). En las cancelaciones realizadas con menos de 2 días de antelación al check-in, se te reembolsará el 5% de la cantidad total menos el coste por la cuota de servicio de EuskalRent.<br></h5>
                            <h5>Le recordamos que desde el mismo 13 de julio de 2015 deja de estar disponible la políca de Cancelación Gratuita. La política de Cancelación Gratuita y sus términos permanecen intactos para todas aquellas reservas que fueron confirmadas o solicitadas antes del 13 de Julio de 2015. Esto es, para las propiedades en las que el proveedor así lo estableció a la hora de realizar una reserva.</h5>
                            </div>
                            <div class="cancellation-policy cancellation-policy-flexible" id="cancellation-policy-flexible">
                            <h4 class="margin-0-t">
                            Política de Cancelación:
                            <span class="orange">Flexible</span>
                            </h4>
                            <h5>Si cancelas la reserva al menos 2 días antes de la fecha del check-in antes de las 12 del mediodía, CET (hora central europea), recibirás el reembolso total de tu reserva, menos la tasa de cancelación. En el caso de cancelaciones realizadas con menos de 2 días de antelación, se te reembolsará el 5% del total de la reserva menos la tasa de cancelación.</h5>
                            </div>
                            <div class="cancellation-policy cancellation-policy-hard" id="cancellation-policy-hard">
                            <h4 class="margin-0-t">
                            Política de Cancelación:
                            <span class="red">Estricta</span>
                            </h4>
                            <h5>Si cancelas la reserva al menos 7 días antes de la fecha del check-in y antes de las 12 del mediodía, CET (hora central europea), recibirás el reembolso de la mitad del total de tu reserva, menos la tasa de cancelación. En el caso de cancelaciones realizadas con menos de 7 días de antelación, se te reembolsará el 5% del total de la reserva menos la tasa de cancelación.</h5>
                            </div>
                            <h3 class="h-light margin-0">4. ¿Qué sucede si el anfitrión cancela?</h3>
                            <ul>
                            <li>EuskalRent se toma las cancelaciones de reservas muy en serio, pues suponen una experiencia negativa para los huéspedes.</li>
                            <li>En caso de cancelación por parte del anfitrión, al huésped se le reembolsará el importe total de la reserva. En estos casos, sin gastos de cancelación.</li>
                            <li>EuskalRent ayudará al huésped a encontrar un alojamiento alternativo.</li>
                            <li>El anfitrión deberá pagar un cargo por cancelación del<strong>15%</strong> del importe total de la reserva. La tasa de cancelación se elevará al <strong>50%</strong> del importe total si el anfitrión cancela su reserva con menos de ocho días de antelación al check-in. Si el anfitrión tiene "Reserva Inmediata" y la reserva se cancela en el plazo de 24 horas tras la confirmación, el cargo por cancelación será del <strong>5%</strong>.</li>
                            <li>La tasa de cancelación será deducida de la próxima reserva del anfitrión.</li>
                            <li> El anfitrión no recibirá ningún pago por una reserva que haya cancelado.</li>
                            <li>La propiedad involucrada en la cancelación será penalizada en el ranking por lo que sus reservas futuras podrían disminuir. </li>
                            <li>Un comentario de sólo una estrella será añadido a la sección de valoraciones de dicha oferta. </li>
                            </ul>
                     </section>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer">
            <div class="container">
                <p class="text-muted textoFooter center-block">EuskalRent - Joseba Alonso, Diego Tobarra y Asier Martinez</p>
            </div>
    </footer>
        
    </body>
    <!-- JS -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/main.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
</html>
