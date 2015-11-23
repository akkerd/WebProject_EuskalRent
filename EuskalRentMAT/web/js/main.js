$(document).ready(function(){
    
    
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
    
    $("#accede").click(function (){ 
        
        var email = $("#loginEmail").val();
        var pass = $("#loginPass").val();
        
        var usuario = JSON.parse(localStorage.getItem(email));

        
        if((usuario !== null) && (usuario.pass = pass)){
            
            $("#menuAccede").remove();
            $.get("menuUsuario.html", function (data) {
                    $("#bs-example-navbar-collapse-1").append(data);
            });
            
        } else {
            $("#noExiste").text("El usuario no existe o su contraseña es invalida");           
        }

        
    });
    
    
   
    
});