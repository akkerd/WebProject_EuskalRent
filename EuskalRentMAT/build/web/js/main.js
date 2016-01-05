/* global RegistroAloj */

$(document).ready(function(){
       
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
    
    //------------------------ DIEGO DRAG --------------------------------------
    var dropZoneId = "drop-zone";
    var buttonId = "clickHere";
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

    if (buttonId !== "") {
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
    }
    
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
            $('#fotoDrag').val(e.target.result.toString());
        };
        reader.readAsDataURL(file);
    }
    
    function ignoreDrag(e){
      e.stopPropagation();
      e.preventDefault();
    }
    //-------------------------------------------------------------------------

    // JOSEBA DRAG
    //$(document).on('dragover','.cambiable',function(){   
           

           /*$('#drop-zone #drop-zone2').on('dragover',function(e){
               
               e.stopPropagation();
               e.preventDefault();
           });

           $('#drop-zone').on('drop',function(e){
               e.preventDefault();
               e.stopPropagation();
               drop(e);
           });
           
            $('#drop-zone2').on('drop',function(e){
               e.preventDefault();
               e.stopPropagation();
               drop2(e);
           });
           
       
           var dropZone;
           var dropZone2;*/
                     
         //window.onload = function(){
             
           /*dropZone = document.getElementById("drop-zone");
           dropZone.ondragenter = ignoreDrag;
           dropZone.ondragover = ignoreDrag;
           dropZone.ondrop = drop;
           
           dropZone2 = document.getElementById("drop-zone2");
           dropZone2.ondragenter = ignoreDrag;
           dropZone2.ondragover = ignoreDrag;
           dropZone2.ondrop = drop2;*/
         //};
         /*function ignoreDrag(e){
           e.stopPropagation();
           e.preventDefault();
         }

        function drop(e){
           e.stopPropagation();
           e.preventDefault();

           var data = e.dataTransfer;
           var files = data.files;
           processFiles(files);*/    
        //}

         /*function processFiles(files){
            var file = files[0],
            reader = new FileReader();
            reader.onload = function(e){
            dropZone.style.backgroundImage = "url('"+e.target.result+"')";
            };
            reader.readAsDataURL(file);
         }
         
         function drop2(e){
           e.stopPropagation();
           e.preventDefault();

           var data = e.dataTransfer;
           var files = data.files;

           processFiles2(files);
        }

         function processFiles2(files){
            var file = files[0],
            reader = new FileReader();
            reader.onload = function(e){
            dropZone2.style.backgroundImage = "url('"+e.target.result+"')";
           };
           reader.readAsDataURL(file);
         }
   
     }); */
         
    
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
        google.maps.event.trigger(mapa,'resize');
       
    });
    
    //----Fin-Control de navegación en la página de perfil---
    
    //control de fechas
    document.getElementById("date-llegada").onchange = function () {
        var input = document.getElementById("date-salida");
        input.setAttribute("min", this.value);
    };
    
  //-----geolocation
  //initMapa();
   

});