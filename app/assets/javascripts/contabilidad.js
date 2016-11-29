
$(document).ready(function(){
var cont=0;

       $("#search_conta").each(function(){
      
            $(this).daterangepicker({ "locale": {
              "format": "DD/MM/YYYY",
              "separator": " - ",
              "applyLabel": "Aceptar",
              "cancelLabel": "Cancelar",
              "fromLabel": "From",
              "toLabel": "To",
              "customRangeLabel": "Custom",
              "daysOfWeek": [
                  "Do",
                  "Lu",
                  "Ma",
                  "Mi",
                  "Ju",
                  "vi",
                  "S&aacute;"
              ],
              "monthNames": [
                  "Enero",
                  "Febrero",
                  "Marzo",
                  "Abril",
                  "Mayo",
                  "Junio",
                  "Julio",
                  "Agosto",
                  "Septiembre",
                  "Octubre",
                  "Noviembre",
                  "Diciembre"
              ],
              "firstDay": 1
          }, autoclose: true,
          autoSize: true,
          minDate: new Date(2015,12,1),
          maxDate: new Date(2016,11,31)


          });

     });

   var config = {'.chosen-select' : {}};

    for (var selector in config) {
      $(selector).chosen(config[selector]);
    };

   //libro mayor

    $('.chosen-select').on('change', function (e) {
      populateFields();
    });

//balance de sumas y saldos
    $('#tb1').on('click', function (e) {
        $('#tb2').addClass('no-print');
        $('#tb1').removeClass('no-print');
     
    });
      $('#tb2').on('click', function (e) {
         $('#tb1').addClass('no-print');
         $('#tb2').removeClass('no-print');
     
    });


  });



function cuentas_cant (num){
    if(num!=0){
      $(".seleccion").show(); //muestro mediante id   
    }else{
     $(".seleccion").hide(); //oculto mediante id  
    }
};

function populateFields () {
var label = $(".chosen-select option:selected").text();
var arr_cont=label.split('.');
//se verifica si el select esta vacia
      if(arr_cont.length==1){
        $("div.ocultable").each(function(){
         $(this).show();//muestro  todo
        });
      }else{
      $("div.ocultable").each(function(){
        $(this).hide();//oculto todo
      });
      }
    
    for (var j = 0; j < arr_cont.length; j++) { 
      console.log(arr_cont[j]);

    $("#"+arr_cont[j]).each(function(){
        $(this).show(); //muestro mediante id
        console.log($("#"+arr_cont[j]).show());
      });

       
    };

  };


       


