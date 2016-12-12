
$(document).ready(function(){


var cont=0;
var fecha = new Date();
var ejercicio=fecha.getFullYear();
 $("#my-select").change(function() {
      var text= $('#my-select option:selected').html();
      ejercicio=parseInt(text);
      
            $("#search_conta").daterangepicker({ "locale": {
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
          minDate: new Date((ejercicio-1),12,1),
          maxDate: new Date(ejercicio,11,31)


          });

    });

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
          minDate: new Date((ejercicio-1),12,1),
          maxDate: new Date(ejercicio,11,31)


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


  $('.vali').on('nested:fieldAdded', function(event) {
  var field;
  field = event.field;
  field.validator();
});




  });
      $(document).on('nested:fieldAdded','div#account_plans form', function(event) {
       
          console.log("Agregado");
         $(event.target).find(':input').enableClientSideValidations();
        });

           $(document).on('nested:fieldAdded','div#accounting_years form', function(event) {
       
          console.log("Agregado");
         $(event.target).find(':input').enableClientSideValidations();
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




