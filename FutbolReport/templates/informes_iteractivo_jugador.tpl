{% extends 'base.tpl' %}
{% block body%}    
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">          
          <div class="row">
            <div class="col-lg-12">
              <h3 class="page-header"><i class="icon_piechart"></i> INFORMES ITERACTIVO JUGADOR</h3>
            </div>
          </div>
          
          <!-- page start--> 
          <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <ul class="nav pull-center top-menu">                    
                  <li id="label_temporada_jugador_iteractivo_a" class="dropdown">
                    <label for="labelTemporada" form style="width:100px">Seleccione temporada</label>       
                  </li>
                  <li class="dropdown">
                    <select class="form-control" id="iteractivo_jugador_temporada_a">
                      <option value="2016">2016/2017</option>
                      <option value="2017">2017/2018</option>
                      <option value="todo">Todas</option>
                    </select>
                  </li>
                </ul>
                <ul class="nav pull-center top-menu">                    
                  <li id="label_jugador" class="dropdown">
                    <label for="labelTemporada" form style="width:100px">Seleccione jugador</label>       
                  </li>
                  <li class="dropdown">
                    <select class="form-control" id="iteractivo_jugador_jugador_a">                                                     
                    </select>
                  </li>
                </ul>               
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <ul class="nav pull-center top-menu">                    
                  <li id="label_temporada_jugador_iteractivo_b" class="dropdown">
                    <label for="labelTemporada" form style="width:100px">Seleccione temporada</label>       
                  </li>
                  <li class="dropdown">
                    <select class="form-control" id="iteractivo_jugador_temporada_b">
                      <option value="2016">2016/2017</option>
                      <option value="2017">2017/2018</option>
                      <option value="todo">Todas</option>
                    </select>
                  </li>
                </ul>
                <ul class="nav pull-center top-menu">                    
                  <li id="label_jugador" class="dropdown">
                    <label for="labelTemporada" form style="width:100px">Seleccione jugador</label>       
                  </li>
                  <li class="dropdown">
                    <select class="form-control" id="iteractivo_jugador_jugador_b">                                                     
                    </select>
                  </li>
                </ul>              
            </div>         
          </div>  
          <div class="row">         
            <div class="col-md-12" id="linechart_material" style="width: 900px; height: 300px;"></div>
          </div>        

<script type="text/javascript" src="/js/charts_google.js"></script>
<script>

  google.charts.load("current", {packages:["corechart"]});
  var anos_jugadores_select_a = {{anos_jugadores_select_a}};
  var anos_jugadores_select_b = {{anos_jugadores_select_b}};

  var select_temporada_a= $('#iteractivo_jugador_temporada_a');
  var select_jugador_a= $('#iteractivo_jugador_jugador_a');  
  var select_temporada_b= $('#iteractivo_jugador_temporada_b');
  var select_jugador_b= $('#iteractivo_jugador_jugador_b'); 

  select_temporada_a.on('change', function() {
  
    select_jugador_a.empty();    
    var lista_jugadores_a= anos_jugadores_select_a[select_temporada_a.val()];    

    $.each(lista_jugadores_a, function( index, jugador ) {
    
      $('<option>')
        .attr('value', jugador[0] + '||' + jugador[1])
        .text( jugador[0] + '||' + jugador[1] + '||' + jugador[2])
        .appendTo(select_jugador_a);

    });  

  })


  var jugador_a = null;
  var jugador_b = null;

  function printar_si_AB(){
      if (jugador_a != null && jugador_b != null){        
        // tabla inicio
        google.charts.load('current', {'packages':['line']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

          var data = google.visualization.arrayToDataTable([
            ['Quarks', 'Leptons', 'Gauge Bosons', 'Scalar Bosons'],
            [2/3, -1, 0, 0],
            [2/3, -1, 0, null],
            [2/3, -1, 0, null],
            [-1/3, 0, 1, null],
            [-1/3, 0, -1, null],
            [-1/3, 0, null, null],
            [-1/3, 0, null, null]
          ]);

          var options = {
            title: 'Charges of subatomic particles',
            legend: { position: 'top', maxLines: 2 },
            colors: ['#5C3292', '#1A8763', '#871B47', '#999999'],
            interpolateNulls: false,
          };
          
          var chart = new google.visualization.Histogram(document.getElementById('linechart_material'));
          chart.draw(data, options);        
        }
        // tabla fin
      }
  }

  select_jugador_a.on('change', function() {
  
  var jug = this.value.split('||');
  
  $.getJSON( "/jugador_iteractivo", { nombre: jug[0], fecha: jug[1], ano: $("#iteractivo_jugador_temporada_a").val() } )
  
    .done(function( json ) {

      console.log( "JSON Data: " + json.nombre );
      console.log( "JSON Data: " + json );
      jugador_a = json;
      printar_si_AB();  
    })
      
      .fail(function( jqxhr, textStatus, error ) {
        var err = textStatus + ", " + error;
        console.log( "Request Failed: " + err );
      });

                      
  });  

  select_temporada_b.on('change', function() {
  
    select_jugador_b.empty();    
    var lista_jugadores_b= anos_jugadores_select_b[select_temporada_b.val()];    

    $.each(lista_jugadores_b, function( index, jugador ) {
    
      $('<option>')
        .attr('value', jugador[0] + '||' + jugador[1])
        .text( jugador[0] + '||' + jugador[1] + '||' + jugador[2])
        .appendTo(select_jugador_b);

    });  

  })


  select_jugador_b.on('change', function() {
  
  var jug = this.value.split('||');
  
  $.getJSON( "/jugador_iteractivo", { nombre: jug[0], fecha: jug[1], ano: $("#iteractivo_jugador_temporada_b").val() } )
  
    .done(function( json ) {

      console.log( "JSON Data: " + json.nombre );
      jugador_b = json;
      printar_si_AB();      
    })
      
    .fail(function( jqxhr, textStatus, error ) {
      var err = textStatus + ", " + error;
      console.log( "Request Failed: " + err );
    });

                      
  });  
  </script>     
          <!-- page end-->
        </section>
      </section>
      <!--main content end-->
{% endblock%}
