
// cuando selecciono un valor de pago
$(document).on("change", ".select", function(){
        var id = "#"+$(this).attr("id");
        var cheque =  "#"+$(this).parents().siblings(".detalle").attr("id");
        mostrarCheque(id,cheque);
    });

$(document).on("change", ".subtotal", function(){
        var id = "#"+$(this).attr("id");
        $(".total").val(sumarSubtotales());
    });

// funcion para mostrar o ocultar campos ocultos
function mostrarCheque(id,detalle){
	if ($(id).val() == "2") {
    	$(detalle).show();
        $(detalle).children(".tarjeta").hide();
        $(detalle).children(".cheque").show();
        mostrarEncabezado();

    } else if($(id).val() == "3" || $(id).val() == "4"){
        $(detalle).show();
        $(detalle).children(".cheque").hide();
        $(detalle).children(".tarjeta").show();
        mostrarEncabezado();  	     
    }else{
        $(detalle).hide();
        mostrarEncabezado();        
    }
}
      
function mostrarEncabezado(){
    var bol=false;
    var id;
    $(".select").each(function(){
        var aux = $(this).val();
        if(aux == 2 || aux == 3  || aux == 4){
            bol = true;
            id = $(this).attr("id");
        }
        console.log(aux);
    });
    if(bol == true){
        $("#det").show();
        $("#opc").show();
    } else {
        $("#det").hide();
        $("#opc").hide();
    }
    
}

function sumarSubtotales(){
    var sum=0;
    $(".subtotal").each(function(){
            sum+=parseInt($(this).val());
    });
    return sum;
}