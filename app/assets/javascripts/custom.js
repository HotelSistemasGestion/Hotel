$(document).ready(function(){ 

	console.log("Estoy funcionando En custom.Js,Aqui van los Javascript Caseros");

      $('.datepicker').each(function(){
          //var datepicker = $.fn.datepicker.noConflict();
          //$.fn.bootstrapDP = datepicker;  
          //$("#dp3").bootstrapDP();  

      $(this).datepicker({format: 'yyyy-mm-dd', autoclose: true});
      });
      
      //Java script para que nested form reconozca los <tr>
      window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
		  var $tr = $(link).closest('tr');
		  return $(content).insertBefore($tr);
		}

	$(document).on('change','#service_select',function(){
              console.log("se cambio un select");});



    $('input[name="daterange"]').daterangepicker({
       });
});
