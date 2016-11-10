var init_function;
init_function=function(){
  $('#_search').on('ajax:success',function(event,data,status){
    $('#stock').replaceWith(data);
    init_function();
  })

};

$(document).ready(function(){

init_function();
	console.log("Estoy funcionando En custom.Js,Aqui van los Javascript Caseros");

 

      $('.datepicker').each(function(){
          //var datepicker = $.fn.datepicker.noConflict();
          //$.fn.bootstrapDP = datepicker;  
          //$("#dp3").bootstrapDP();  


          $(this).datepicker({
            format: 'dd-mm-yyyy',
            language: 'es',
            startDate: '+1d', 
            autoclose: true}
            );
    });


       $("#search").each(function(){
      
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
    
      //Java script para que nested form reconozca los <tr>
      window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
		  var $tr = $(link).closest('tr');
		  return $(content).insertBefore($tr);
		  } 


      

      



  });
      
 
