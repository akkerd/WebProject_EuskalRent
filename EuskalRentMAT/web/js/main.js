$(document).ready(function(){
    //Handles menu drop down
    $('.dropdown-menu').find('form').click(function (e) {
        e.stopPropagation();
    });
    $('.myCarousel').carousel({
        interval: 3000
    });
    
    
    $("#accede").click(function (){ //función para el boton de enviar
        //recolectamos en variables, lo que tenga cada input.
        //Para mejor manipulación en los if's
        var nombre = $("#loginEmail").val();
        var apellidos = $("#loginPass").val();

        
        $("#menuAccede").remove();
        $.get("menuUsuario.html", function (data) {
                    $("#bs-example-navbar-collapse-1").append(data);
        });

        

    });
    
    //function to sign in
    function login() {
        var inputUsername = localStorage.getItem("username");
        var inputPassword = localStorage.getItem("password");
        if (username != "undefined" || username != "null" || password != "undefined" || password !="null")
        {
           document.getElementByID('welcomeMessage').innerHTML = "Welcome " + username + "!";
        } else
            document.getElementById('welcomeMessage').innerHTML = "Hello!";
     }
    
    
});