$(document).ready(function(){
    
    
<<<<<<< HEAD
  
    
    //Joseba
  
  
=======
    comprobarLogin();
    function comprobarLogin()
    {
        
        var userLogged = sessionStorage.getItem("logged");
        if(userLogged === null){
            sessionStorage.setItem("logged",0);
            userLogged = sessionStorage.getItem("logged");
        } else if (userLogged !== "0"){
            var usuario = JSON.parse(sessionStorage.getItem(userLogged));
        }

        if(userLogged === "0"){
            cambiarCabeceraNotLoged();

        }  else {
            cambiarCabeceraLoged(usuario.nombre);
        } 
            
        
    }

    function cambiarCabeceraLoged(nombre)
    {
        $("#borrableLogearse").remove();
        $.get("menuUsuario.html", function (data) {
            $("#menuCambiable").append(data);
        });
        $("a#nombreUser").text(nombre);        
    }
    function cambiarCabeceraNotLoged()
    {
        $("#borrableUsuario").remove();
        $.get("menuLogearse.html", function (data) {
            $("#menuCambiable").append(data);
        });       
    }   
    
    //Handles menu drop down
    $('.dropdown-menu').find('form').click(function (e) {
        e.stopPropagation();
    });
    $('.myCarousel').carousel({
        interval: 3000
    });
    
    $(".formLogin").bind('change blur keyup',function(e){
        var elemento = e.target;
        if (elemento.validity.valid) {
            elemento.style.background = '#FFFFFF';
            if(elemento === document.getElementById("loginEmail")){
                $("#avisoEmailLogin").text("");
            }
            else if(elemento === document.getElementById("loginPass")){
                $("#avisoPassLogin").text("");
            }
            
        }
        else {
            elemento.style.background = '#FFA1A1';
            if(elemento === document.getElementById("loginEmail")){
                $("#avisoEmailLogin").text("Introduzca un correo válido");
            }
            else if(elemento === document.getElementById("loginPass")){
                $("#avisoPassLogin").text("Introduzca una contraseña valida");
            }
           
        }
    });
    
    $( "#menuCambiable" ).on( "click","#accede" ,function() {

        var email = $("#loginEmail").val();
        var pass = $("#loginPass").val();
        var usuario = JSON.parse(sessionStorage.getItem(email));

        
        if((usuario !== null) && (usuario.pass === pass)){
            
            cambiarCabeceraLoged(usuario.nombre)

            sessionStorage.setItem("logged",usuario.email);         
        }
        $("a#nombreUser").text(usuario.nombre); 
    });
    $( "#menuCambiable" ).on( "click","#logout" ,function() {

        
        sessionStorage.setItem("logged",0);
        cambiarCabeceraNotLoged();
        $("a#nombreUser").text("ACCEDE");   
        
        
        
        
 
    });
    


    
    
    //Joseba
    //función para añadir datos JSON a la sesion.
    $("#formulario-registro").click(function(){
        
        nombre = $("#nombre").val();
        apellidos = $("#appellidos").val();
        tel = $("#tel").val();
        email = $("#email").val();
        pwd = $("#pwd").val();
        
        
        
        var datos = {
            nombre : nombre,
            apellidos : apellidos,
            telefono : tel,
            email : email,
            pass : pwd
        };
        
        var json = JSON.stringify(datos);;
        
        sessionStorage.setItem(email,json);
        
    });
    
>>>>>>> origin/master
    //validación en la página de perfil
    $(document).on('click','.cambiable',function(){
        $(".form-control").bind('change blur keyup',function(e){
            validar(e); 
        });
    });
    //validación en la página de registro
    $(".formularioRegistro").bind('change blur keyup',function(e){
        validar(e);
    });
     //Función de validación del formulario con comprobación de contraseña
    function validar(e){
        var elemento = e.target;
        if (elemento.validity.valid) {
            elemento.style.background = '#FFFFFF';
            if(elemento === document.getElementById("nombre")){
                $("#span-nombre").text("");
            }
            else if(elemento === document.getElementById("tel")){
                $("#span-tel").text("");
            }
            else if(elemento === document.getElementById("email")){
                $("#span-email").text("");
            }
        }
        else {
            elemento.style.background = '#FFA1A1';
            if(elemento === document.getElementById("nombre")){
                $("#span-nombre").text("Introduzca un nombre válido");
            }
            else if(elemento === document.getElementById("tel")){
                $("#span-tel").text("Introduzca un teléfono válido");
            }
            else if(elemento === document.getElementById("email")){
                
                $("#span-email").text("Introduzca un email válido");
            }
        }
        
        var pwd = document.getElementById("pwd");
        var pwd2 = document.getElementById("pwd2");

        $(pwd).bind('change keyup',function(){
            if(pwd.value !== pwd2.value) {
                pwd2.setCustomValidity("La contraseña no coincide");
            }
            else {
                pwd2.setCustomValidity('');
            }
        });
        $(pwd2).bind('change keyup',function(){
            if(pwd.value !== pwd2.value) {
                pwd2.setCustomValidity("La contraseña no coincide");
                pwd2.style.background = '#FFA1A1';
                $("#span-pwd2").text("La contraseña no coincide");
            } 
            else {
                pwd2.setCustomValidity('');
                pwd2.style.background = '#FFFFFF';
                $("#span-pwd2").text("");
            }
        });             
    }

<<<<<<< HEAD
   
    //------------------------ DIEGO DRAG --------------------------------------
    var dropZoneId = "drop-zone";
    //var buttonId = "clickHere";
    var mouseOverClass = "mouse-over";

    var dropZone = $("#" + dropZoneId);
    
    var ooleft = dropZone.offset().left;
    var ooright = dropZone.outerWidth() + ooleft;
    var ootop = dropZone.offset().top;
    var oobottom = dropZone.outerHeight() + ootop;
    var inputFile = dropZone.find("input");
    
    document.getElementById(dropZoneId).addEventListener("dragenter", function (e) {
        ignoreDrag(e);  
    });
    
    document.getElementById(dropZoneId).addEventListener("dragover", function (e) {
        e.preventDefault();
        e.stopPropagation();
        dropZone.addClass(mouseOverClass);
        var x = e.pageX;
        var y = e.pageY;

        if (!(x < ooleft || x > ooright || y < ootop || y > oobottom)) {
            inputFile.offset({ top: y - 15, left: x - 100 });
        } else {
            inputFile.offset({ top: -400, left: -400 });
        }

    }, true);

    /*if (buttonId !== "") {
        var clickZone = $("#" + buttonId);

        var oleft = clickZone.offset().left;
        var oright = clickZone.outerWidth() + oleft;
        var otop = clickZone.offset().top;
        var obottom = clickZone.outerHeight() + otop;

        $("#" + buttonId).mouseover(function (e) {
            var x = e.pageX;
            var y = e.pageY;
            if (!(x < oleft || x > oright || y < otop || y > obottom)) {
                inputFile.offset({ top: y - 15, left: x - 160 });
            } else {
                inputFile.offset({ top: -400, left: -400 });
            }
        });
    }*/
    
    document.getElementById(dropZoneId).addEventListener("drop", function (e) {
        e.stopPropagation();
        e.preventDefault();

        var data = e.dataTransfer;
        var files = data.files;
        processFiles(files);
        $("#" + dropZoneId).removeClass(mouseOverClass);
    }, true);
    
    function processFiles(files){
        var file = files[0];
        reader = new FileReader();
        reader.onload = function(e){
            // Pongo fondo de la imagen
            document.getElementById("drop-zone").style.backgroundImage = "url('"+e.target.result+"')";
            // Quito cosas sobrantes del drag-zone
            document.getElementById("dentroFoto").style.display = "none";
            // Añado el base64 a mi input oculto
            
            var base64 = document.getElementById("drop-zone").getAttribute("style");
            $('#fotoDrag').val(base64);
        };
        reader.readAsDataURL(file);
    }
    
    function ignoreDrag(e){
      e.stopPropagation();
      e.preventDefault();
    }
    //------------------------------------------------------------------------- 
         
    
    //----Control de navegación en la página de perfil------
    
      $("#perfil").click(function(){
        $("#gAlojamientos").fadeOut();
        $("#gReservas").fadeOut();
        $("#gSaldo").fadeOut();
        $("#gBorrado").fadeOut();
        $("#gPerfil").fadeIn();
       
    });
    
    $("#reservas").click(function(){
        $("#gAlojamientos").fadeOut();
        $("#gPerfil").fadeOut();
        $("#gBorrado").fadeOut();
        $("#gSaldo").fadeOut();
        $("#gReservas").fadeIn();
       
    });
    
    $("#alojamiento").click(function(){
        $("#gPerfil").fadeOut();
        $("#gReservas").fadeOut();
        $("#gBorrado").fadeOut();
        $("#gSaldo").fadeOut();
        $("#gAlojamientos").fadeIn();
        
        google.maps.event.trigger(mapa,'resize');
       
    });
    $("#borrado").click(function(){ 
        $("#gAlojamientos").fadeOut();
        $("#gPerfil").fadeOut();
        $("#gReservas").fadeOut();
        $("#gSaldo").fadeOut();
        $("#gBorrado").fadeIn();
       
    });
     $("#saldo").click(function(){
        $("#gBorrado").fadeOut();
        $("#gAlojamientos").fadeOut();
        $("#gPerfil").fadeOut();
        $("#gReservas").fadeOut();
        $("#gSaldo").fadeIn();
       
    });
    
    //----Fin-Control de navegación en la página de perfil---
    
    //control de fechas
    document.getElementById("date-llegada").onchange = function () {
        var input = document.getElementById("date-salida");
        input.setAttribute("min", this.value);
    };
    
  
   

});

=======
    
    
    // JOSEBA DRAG
    
    


       
           var dropZone;
                     
         window.onload = function(){
             
           dropZone = document.getElementById("drop_zone");
           dropZone.ondragenter = ignoreDrag;
           dropZone.ondragover = ignoreDrag;
           dropZone.ondrop = drop;
         };
         function ignoreDrag(e){
           e.stopPropagation();
           e.preventDefault();
         }
                   
        

        function drop(e){
           e.stopPropagation();
           e.preventDefault();

           var data = e.dataTransfer;
           var files = data.files;

           processFiles(files);
        }

         function processFiles(files){
            var file = files[0],
            reader = new FileReader();
            reader.onload = function(e){
            dropZone.style.backgroundImage = "url('"+e.target.result+"')";
           };
           reader.readAsDataURL(file);
         }
         insertarJson();
                 
         function insertarJson(){
             var email = sessionStorage.getItem("logged");
             var usuario = JSON.parse(sessionStorage.getItem(email));
             
             $("#nombre-perfil").text(usuario.nombre);
             $("#apellidos-perfil").text(usuario.apellidos);
             $("#tel-perfil").text(usuario.telefono);
             $("#email-perfil").text(usuario.email);
         }
  //-----geolocation
  initMapa();
   
    
});

//-------------Geolocation
var mapa;
var direccion = new google.maps.LatLng(42.8591656,-2.681791800000042);
var marcador;
var infoMarcador;
var localizacion;

function initMapa(){
    var mapOptions = {
        center: direccion,
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.SATELLITE
    };
    
    mapa = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    marcador = new google.maps.Marker({  
        position: direccion,
        map: mapa,
        title:"Titulo",
        draggable: true
    });
    
    infoMarcador = new google.maps.InfoWindow({ content:"direccion"});
    function mostrarInfo(){
        infoMarcador.open(mapa, marcador);
    }
    google.maps.event.addListener(marcador, 'click', mostrarInfo);
} 

google.maps.event.addDomListener(window, 'load', initMapa);

function buscarDireccion(direccion) {
    var geoCoder = new google.maps.Geocoder(direccion);
    var consulta = {address:direccion};
    geoCoder.geocode(consulta, function(result, status){
        localizacion = new google.maps.LatLng(result[0].geometry.location.lat(), result[0].geometry.location.lng());
    });
    
    mapa.panTo(localizacion);
    mapa.setZoom(17);
    marcador.setPosition(localizacion);
    
}
>>>>>>> origin/master
