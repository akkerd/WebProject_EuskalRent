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
            }else if(elemento === document.getElementById("tarifa")){
                $("#span-tarifa").text("");
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
            else if(elemento === document.getElementById("tarifa")){
                $("#span-tarifa").text("Introduzca un numero con dos decimales entre 0.00 y 9999.99");
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

    //guarda los valores de la página de registro
    $("#formulario-registro").click(function(){

        nombre = $("#nombre").val();
        apellidos = $("#apellidos").val();
        tel = $("#tel").val();
        email = $("#email").val();
        pwd = $("#pwd").val();

        guardaJson(nombre,apellidos,tel,email,pwd);
        // DIEGO Cuando te registras te loegea automaticamente
        sessionStorage.setItem('logged',email);        
    });
    
    //guarda los valores de la página perfil, valores modificados
    $("#formulario-cambio").click(function(){

        nombre = $("#nombre-perfil").val();
        apellidos = $("#apellidos-perfil").val();
        tel = $("#tel-perfil").val();
        email = $("#email-perfil").val();
        pwd = $("#pwd-perfil").val();

        guardaJson(nombre,apellidos,tel,email,pwd);

    });
    
     //función para añadir datos JSON a la sesion.     
    function guardaJson(nombre,apellidos,tel,email,pwd){
        var datos = {
            nombre : nombre,
            apellidos : apellidos,
            telefono : tel,
            email : email,
            pass : pwd
        };
        
        var json = JSON.stringify(datos);;
        
        sessionStorage.setItem(email,json);
    }  
    
    //control de fechas
    document.getElementById("date-llegada").onchange = function () {
        var input = document.getElementById("date-salida");
        input.setAttribute("min", this.value);
    }; 
    
});