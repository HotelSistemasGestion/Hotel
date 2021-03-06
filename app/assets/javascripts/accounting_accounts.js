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
                        $("#invoice").append('<tr><td><input class="form-control" value='+result[index].numero+'></input></td><td><input class="form-control subtotal" id="subtotal" value='+result[index].total+'></input></td><td><a class="btn btn-primary" title="" data-toggle="tooltip" data-placement="rigth" data-remote="true" href='+"/invoices/"+result[index].id+' data-original-title="Ver Factura"><span class="glyphicon glyphicon-eye-open"></span></td></tr>');    
                    
                    })
                    $(".total").val(sumarSubtotales());
                } 
            });
    });
}

