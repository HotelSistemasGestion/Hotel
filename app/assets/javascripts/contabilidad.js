
$(document).ready(function(){


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
          autoSize: true

          });

     });

   var config = {'.chosen-select' : {}};

    for (var selector in config) {
      $(selector).chosen(config[selector]);
    };
   

    $('.chosen-select').on('change', function (e) {
      populateFields();
    });

  });
function populateFields () {
        var label = $(".chosen-select option:selected").text();

        var arr_cont=label.split('.');
      $("div.ocultable").each(function(){
        $(this).hide();//oculto todo

      });
          for (var j = 0; j < arr_cont.length; j++) {             
              if(arr_cont[j]!=null){
               $("#"+arr_cont[j]+"").show(); //muestro mediante id

               };

              }

  };
      
       


