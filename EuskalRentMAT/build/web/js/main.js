$(document).ready(function(){
    
    
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
    var nombre = "";
    var apellidos = "";
    var correo = "";
    var pass = "";
    var repass = "";
    
    $('.dropdown-menu').find('form').click(function (e) {
        e.stopPropagation();
    });
    $('.myCarousel').carousel({
        interval: 3000
    });
//<<<<<<< HEAD
    $("#boton").click(function (){ //función para el boton de enviar
        //recolectamos en variables, lo que tenga cada input.
        //Para mejor manipulación en los if's
        nombre = $("#nombre").val();
        apellidos = $("#apellidos").val();
        correo = $("#correo").val();
        pass = $("#pass").val();
        repass = $("#repass").val();
    });
    
    $("#botonFormPerfil").click(function(){
        nombre = $("#nombre").val();
        apellido = $("#apellido").val();
        correo = $("#correo").val();
        pass = $("#pass").val();
        repass = $("#repass").val();
        
        $("#repass").keyup(function(e) {
		var pass = $("#pass").val();
		var re_pass=$("#repass").val();

		if(pass !== re_pass)
		{
			$("#repass").css({"background":"#F22" }); //El input se pone rojo
			valido=true;
		}
		else if(pass === re_pass)
		{
			$("#repass").css({"background":"#8F8"}); //El input se ponen verde
			$("#mensaje4").fadeOut();
			valido=true;
		}
        });
        
        var json = {
            nombre : nombre,
            apellidos : apellido,
            correo : correo,
            pass : pass
        };
        localStorage.setItem("JSON", json);
    });
});

/********************* PERFIL *****************************/
    
    $("#formConfig").click(function(){
        var inputNombre = $("#nombre");
        var inputApellido = $("#apellidos");
        var inputEmail = $("#email");
        var inputFoto = $("#foto");
        
        inputNombre.val("Sí, funciona");
        
        $.getJSON(localStorage.getItem("JSON"), function(data){
           $.each( data, function(key, val){
              switch(key){
                case "nombre":
                      inputNombre.val("DIego"); 
                      break;
                case 'apellido':
                    if (val !== "")
                        inputApellido.val(val);
                    break
                case 'email':
                    if (val !== "")
                        inputEmail.val(val);
                    break;
                case 'foto':
                    if (val !== null)
                        inputFoto.val(val);
                    break;
              }
           });
        });   
    });        
//=======
    
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
//>>>>>>> refs/remotes/origin/master
