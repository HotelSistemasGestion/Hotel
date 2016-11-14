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


    
      //Java script para que nested form reconozca los <tr>
      window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
		  var $tr = $(link).closest('tr');
		  return $(content).insertBefore($tr);
		  } 


      

      



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
