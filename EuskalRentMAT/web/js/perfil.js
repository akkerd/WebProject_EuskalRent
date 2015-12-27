/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//----Control de navegación en la página de perfil------

$("#perfil").click(function(){
    $("#gAlojamientos").fadeOut();
    $("#gReservas").fadeOut();
    $("#gPerfil").fadeIn();

});

$("#reservas").click(function(){
    $("#gAlojamientos").fadeOut();
    $("#gPerfil").fadeOut();
    $("#gReservas").fadeIn();
});

$("#alojamiento").click(function(){
    $("#gPerfil").fadeOut();
    $("#gReservas").fadeOut();
    $("#gAlojamientos").fadeIn();
    // Recolocar el mapa y su centro
    google.maps.event.trigger(mapa, 'resize');
    mapa.panTo(marcador.getPosition());
});

//----Fin-Control de navegación en la página de perfil---
    
//----Insertar datos del usuario en la página perfil
insertarJson();

function insertarJson(){
    var email = sessionStorage.getItem("logged");
    if( email !== "0" ){
       var usuario = JSON.parse(sessionStorage.getItem(email));

       $("#nombre-perfil").val(usuario.nombre);
       // Cuidado con APELLIDOS <-- Cambiado
       $("#apellidos-perfil").val(usuario.apellidos); 
       $("#tel-perfil").val(usuario.telefono);
       $("#email-perfil").val(usuario.email);
   }else{
       window.alert("No hay usuario logeado");
   }
}
//----Fin--Insertar datos del usuario en la página perfil