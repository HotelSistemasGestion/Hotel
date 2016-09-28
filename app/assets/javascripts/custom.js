
function probando(){
	console.log("Estoy funcionando En custom.Js,Aqui van los Javascript Caseros");
}

$(document).ready(function(){ 
      $('.datepicker').each(function(){
      $(this).datepicker({format: 'yyyy-mm-dd', autoclose: true});
      });
});