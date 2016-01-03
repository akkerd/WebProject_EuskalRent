/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// Inicializar mapa al cargar
google.maps.event.addDomListener(window, 'load', initMapa);

//-------------Geolocation
var mapa;
var direccion = new google.maps.LatLng(42.839290, -2.674297);
var marcador;
var infowindow;
var geoCoder = new google.maps.Geocoder(direccion);
   

function recolocarMarcador(pDireccion){
    mapa.panTo(pDireccion);
    marcador.setPosition(pDireccion);
}

function actualizarDireccion(dirStr){
    infowindow.setContent(dirStr);
    $("#buscador").val(dirStr);
}

function initMapa(){
    
    //var dir = $("#direccion").innerHTML;
    var dir = "Bastiturri 9";
    buscarDireccion(dir);
} 

function init2( pCoords ){
    var mapOptions = {
        center: pCoords,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.HYBRID
    };
    
    mapa = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    
    infowindow = new google.maps.InfoWindow({
        content: dir
    });
    
    marcador = new google.maps.Marker({  
        position: direccion,
        map: mapa,
        title:"Usted está aquí",
        draggable: true
        //,animation:google.maps.Animation.DROP
    });
    marcador.addListener('click', function() {
        infowindow.open(mapa, marcador);
    });
    marcador.addListener('dragend', function() {
        var dir = marcador.getPosition();
        recolocarMarcador(dir);
        leerCoordenada(dir);
        // Animacion de DROP
        marcador.setAnimation(google.maps.Animation.DROP);
    });
}

function buscarDireccion(pDireccion) {
    var consulta = {address:pDireccion};
    geoCoder.geocode(consulta, function(results, status){
        var dir = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
        
        actualizarDireccion( results[0].formatted_address );
        // Recolocar marcador en el centro
        recolocarMarcador(dir);
        
        init2(dir);
    });
}