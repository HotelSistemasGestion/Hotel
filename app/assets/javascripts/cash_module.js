
// cuando selecciono un valor de pago
$(document).on("change", ".select", function(){
        var id = "#"+$(this).attr("id");
        var cheque =  "#"+$(this).parents().siblings(".cheque").attr("id");
        console.log(cheque);
        mostrarCheque(id,cheque);
    });
// funcion para mostrar o ocultar campos ocultos
function mostrarCheque(id,cheque){
	if ($(id).val() == "2") {
    	$(cheque).show();
    } else {
  	    $(cheque).hide();
    }
}
      
