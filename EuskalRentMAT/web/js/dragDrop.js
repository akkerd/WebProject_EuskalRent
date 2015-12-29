/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// JOSEBA DRAG
  
/*$(document).on('dragover','.cambiable',function(){   


       $('#drop-zone #drop-zone2').on('dragover',function(e){

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
       var dropZone2;

     //window.onload = function(){

       dropZone = document.getElementById("drop-zone");
       dropZone.ondragenter = ignoreDrag;
       dropZone.ondragover = ignoreDrag;
       dropZone.ondrop = drop;

       dropZone2 = document.getElementById("drop-zone2");
       dropZone2.ondragenter = ignoreDrag;
       dropZone2.ondragover = ignoreDrag;
       dropZone2.ondrop = drop2;
     //};
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
 }); 
    
*/