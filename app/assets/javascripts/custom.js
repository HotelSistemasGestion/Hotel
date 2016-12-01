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
            startDate: '+0d'}
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
          autoSize: true,

          });

   });

       $("#reservation_range").each(function(){
      
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
              ]
          },startDate: moment().add(0,'days'),
          endDate: moment().add(2,'days'),
          autoclose: true,
          autoSize: true,
          minDate: moment().add(0,'days'),

          });

        });

    
      //Java script para que nested form reconozca los <tr>
      window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
		  var $tr = $(link).closest('tr');
		  return $(content).insertBefore($tr);
		  } 

      $(document).on('nested:fieldAdded', function(event){
        // this field was just inserted into your form
        $(".datepicker").datepicker({
              format: 'dd-mm-yyyy',
              language: 'es',
              startDate: '+1d'
            });
      });



      

      



  });

 
   ///Scripts para los reportes
/*-----------------------------------------------------------------*/

 $(document).ready(function(){
    $('.r_datepicker_complaint').datepicker({
    format: 'yyyy/mm/dd 00:00:00'
});
    $('.r_datepicker_complaint_lt').datepicker({
    format: 'yyyy/mm/dd 23:59:59'
});
})
  ///Scripts para los reportes
/*-----------------------------------------------------------------*/
