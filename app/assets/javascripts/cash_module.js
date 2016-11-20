$(document).ready(function(){
    search_invoices();
});

// cuando selecciono un valor de pago
$(document).on("change", ".select", function(){
        var id = "#"+$(this).attr("id");
        var cheque =  "#"+$(this).parents().siblings(".detalle").attr("id");
        mostrarCheque(id,cheque);
    });

$(document).on("change", "#invoice", function(){
        var id = "#"+$(this).attr("id");
        $(".total").val(sumarSubtotales());
    });

function search_invoices(){
    $("#cliente").on('railsAutocomplete.select', function (event,data) {                
            var client = data.item.id;
            console.log(client);
            $.ajax({
                type: "GET",
                url: "/client_invoices/"+client,
                dataType: "json",
                data: {"cliente_id" : client},
                success: function(result){

                    $.each(result,function(index){
                        $("#invoice").append('<tr><td><input class="form-control" value='+result[index].numero+'></input></td><td><input class="form-control subtotal" id="subtotal" value='+result[index].total+'></input></td></tr>');    
                    
                    })
                } 
            });
    });
}

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