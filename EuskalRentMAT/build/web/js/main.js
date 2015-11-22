$(document).ready(function(){
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