function escoger_equipo(){
    var dir_equipo = "/equipos/2016";
    window.location.href=dir_equipo; 
}

function escoger_entrenador(){
    var dir_entrenadores = "/entrenadores/2016";
    window.location.href=dir_entrenadores; 
}

function escoger_jugador(){
    var dir_jugadores = "/jugadores/2016";
    window.location.href=dir_jugadores; 
}

function escoger_estadio(){
    var dir_estadios = "/estadios/";
    window.location.href=dir_estadios; 
}

function escoger_informe(){
    var dir_informes = "/informes/";
    window.location.href=dir_informes; 
}

function cambiar_color_fondo(estadio) {        
    $("tr").css("background-color","#eeeeee")
 }

 function retomar_color_fondo(estadio) {        
    fila = $(estadio);
    fila.css("background-color","yellow")
 }

function estadio_seleccionado(estadio){
    $("area").hover(cambiar_color_fondo(estadio),retomar_color_fondo(estadio));
}

function escoger_jornadas(){
    var dir_jornadas = "/jornadas/1/2016";
    window.location.href=dir_jornadas; 
}

function top_menu(){
    var dir_menu = "/top/2016";
    window.location.href=dir_menu; 
}

function init() {

$('#select_jornada').val({{ jornada_seleccionada }});
$('#select_temporada').val({{ temporada_seleccionada }});
$(document).on('change', '#select_temporada', function(event) {
    $('#id_input').val($("#select_temporada").val());    
    var pag = window.location.pathname.slice(0,-5)    
    if (pag.length > 0) {
        var dominio = pag+"/"+$("#select_temporada").val();
            window.location.href=dominio;
      } else {
        var dominio = "/"+$("#select_temporada").val();
            window.location.href=dominio; 
      }  
});

$(document).on('change', '#select_jornada', function(event) {    
    var split = window.location.pathname.split("/")
    var dominio_jornada = "/"+split[1]+"/"+$("#select_jornada").val()+"/"+$("#select_temporada").val();
    window.location.href=dominio_jornada; 
});
}

jQuery(document).ready(function(){
    init();
});


