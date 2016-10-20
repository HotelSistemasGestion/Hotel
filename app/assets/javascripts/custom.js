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
  
  function showCustomer(str) {
    var xhttp;    
    if (str == "") {
      document.getElementById("fecha").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("fecha").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "getcustomer.asp?q="+str, true);
  xhttp.send();
}

  $('input[name="datefilter"]').daterangepicker({
      autoUpdateInput: false,
      dateFormat: 'DD/MM/YYYY',
      showOn: 'button',   
      locale: {
          cancelLabel: 'Clear'
      }
  });

  $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
    var date_select=  $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
    var date_array=date_select.val().split("-");
    var date_start=date_array[0];
    var date_end=date_array[1];
  });

  $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
  });

});





