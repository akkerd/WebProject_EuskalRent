/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//-------------Geolocation
var mapa;
var direccion = new google.maps.LatLng(42.839290, -2.674297);
var marcador;
var infowindow;
var geoCoder = new google.maps.Geocoder(direccion);
    
$(document).ready(function(){
    
  initMapa();
});

$("#buscador").change(function(){
    var dir = document.getElementById('buscador').value;
    buscarDireccion(dir);
    // Se busca con direccion(global) porque TIENE QUE SER COORDENADA, no string
    //leerCoordenada(direccion);
});

 $("#btnBuscador").click(function(){
    var dir = document.getElementById('buscador').value;
    buscarDireccion(dir);
    // Se busca con direccion(global) porque TIENE QUE SER COORDENADA, no string
    //leerCoordenada(direccion);
 });


function initMapa(){
    var mapOptions = {
        center: direccion,
        zoom: 15,
        mapTypeId: google.maps.MapTypeId.HYBRID
    };
    
    mapa = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    
    infowindow = new google.maps.InfoWindow({
        content: "Escuela Universitaria de Ingeniería, Vitoria-Gasteiz"
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

google.maps.event.addDomListener(window, 'load', initMapa);

function buscarDireccion(pDireccion) {
    var consulta = {address:pDireccion};
    geoCoder.geocode(consulta, function(result, status){
        var dir = new google.maps.LatLng(result[0].geometry.location.lat(), result[0].geometry.location.lng());
        // Actualizar el contenido del marcador
        //mapa.setZoom(15);
        infowindow.setContent(result[0].formatted_address);
        infowindow.open(mapa, marcador);
        // Recolocar marcador en el centro
        recolocarMarcador(dir);
    });
}

function recolocarMarcador(pDireccion){
    mapa.panTo(pDireccion);
    marcador.setPosition(pDireccion);
    mapa.setZoom(15);
}

function leerCoordenada(pDireccion) {
  // toString() pasa a String, slice() quita los parentesis, split() convierte en array(2)
  var latlngStr = pDireccion.toString().slice(1,-1).split(',',2);
  var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
  // Funcion para obtener el nombre de la calle
  geoCoder.geocode({'location': latlng}, function(results, status) {
    // El parámetro 'results' es un array de posibles direcciones, de más a menos exacta
    if (status === google.maps.GeocoderStatus.OK) {
      if (results[1]) {
        mapa.setZoom(15);
        // Cogemos la direccion mas excata con results[0]
        infowindow.setContent(results[0].formatted_address);
        infowindow.open(mapa, marcador);
      } else {
        window.alert('No results found');
      }
    } else {
      window.alert('Geocoder failed due to: ' + status);
    }
  });
}