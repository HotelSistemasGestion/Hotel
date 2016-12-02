
$(document).ready(function(){
    search_invoices();
    search_opening();   
    
});


// cuando selecciono un valor de pago
$(document).on("change", ".select", function(){
        var id = "#"+$(this).attr("id");
        var cheque =  "#"+$(this).parents().siblings(".detalle").attr("id");
        mostrarCheque(id,cheque);
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
                    console.log(result);
                    $.each(result,function(index){
                        $("#invoice").append('<tr><td><input class="form-control" value='+result[index].numero+' readonly></input></td><td><input class="form-control subtotal" id="subtotal" value='+result[index].total+' readonly ></input></td><td><a class="btn btn-primary" title="" data-toggle="tooltip" data-placement="rigth" data-remote="true" href='+"/invoices/"+result[index].id+' data-original-title="Ver Factura"><span class="glyphicon glyphicon-eye-open"></span></td></tr>');    
                    
                    })
                    $(".total").val(sumarSubtotales());
                    $(".total").keyup();
                    //$("#ruc").val(result[0].ruc);
                   // $("#direccion").val(result[0].direccion);
                    //$("#telefono").val(result[0].celular);
                    //$("#correo").val(result[0].correo);
                    //console.log(parseInt($("#total").val()));
                } 
            });
    });
}

function search_opening(){
    $("#caja").on('change', function () {                
            apertura = parseInt($(this).val());
            console.log($(this).val());
            $.ajax({
                type: "GET",
                url: "/montos_cierre/"+apertura,
                dataType: "script",
                data: {"opening_cash_id" : apertura},
                 
            });
    });

}
$(document).on('nested:fieldAdded', function(event){
  // this field was just inserted into your form
  var field = event.field; 
  // it's a jQuery object already! Now you can find date input
  var dateField = field.find('.datepicker');
  
  dateField.datepicker();
  $(document).trigger('refresh_autonumeric');
  field.validator();
});
function controlar_valores(){
   var inputs = $(".auto");
   var total = 0;
   $.each(inputs, function(campo){
       total += campo.val();
   });
   $("#btnAceptar").attr("disabled", !(total == $("#total").val()) );
}

// funcion para mostrar o ocultar campos ocultos
function mostrarCheque(id,detalle){
    if ($(id).val() == "2") {
        $(detalle).show();
        $(detalle).children(".tarjeta").removeAttr("required");
        $(detalle).children(".tarjeta").val("");
        $(detalle).children(".tarjeta").hide();
        $(detalle).children(".cheque").prop("required",true);
        $(detalle).children(".cheque").show();

    } else if($(id).val() == "3" || $(id).val() == "4"){
        $(detalle).show();
        $(detalle).children(".cheque").removeAttr("required");
        $(detalle).children(".cheque").val("");
        $(detalle).children(".cheque").hide();
        $(detalle).children(".tarjeta").prop("required",true);
        $(detalle).children(".tarjeta").show();          
    }else{
        $(detalle).hide();
        $(detalle).children(".cheque").val("");
        $(detalle).children(".tarjeta").val("");
        $(detalle).children(".cheque").removeAttr("required");
        $(detalle).children(".tarjeta").removeAttr("required");        
    }
}
      

function sumarSubtotales(){
    var sum=0;
    $(".subtotal").each(function(){
            sum+=parseInt($(this).val());
    });
    return sum;
}


//Funciones para cierre de caja
  function calcularDiferencia(){
    var dif=0;
    var reg=0;
    var exs=0;
    $(".registrados").each(function(){
        reg+=Number($(this).val().replace(/[^0-9\.]+/g,""));
    });
    $(".existentes").each(function(){
        exs+=Number($(this).val().replace(/[^0-9\.]+/g,""));
    });
    dif = exs-reg;
    console.log(dif);
    return dif;
}

function calcularDif(registrados,existentes){
    var reg=Number($(registrados).val().replace(/[^0-9\.]+/g,""));
    var exis=Number($(existentes).val().replace(/[^0-9\.]+/g,""));
    var dif= exis-reg;
    return dif;
}
$(document).on('change','.existentes',function(){
    $("#diferencia").val(calcularDiferencia());
    $("#diferencia").keyup();
    var id = "#"+$(this).attr("id");
    if (id=="#r_efectivo") {
        $("#d_efectivo").val(calcularDif("#efectivo","#r_efectivo"));
        $("#d_efectivo").keyup();
    }else if(id=="#r_cheque"){
        $("#d_cheque").val(calcularDif("#cheque","#r_cheque"));
        $("#d_cheque").keyup();
    }else if (id=="#r_credito") {
        $("#d_credito").val(calcularDif("#credito","#r_credito"));
        $("#d_credito").keyup();
    }else{
        $("#d_debito").val(calcularDif("#debito","#r_debito"));
        $("#d_debito").keyup();
    }
});

$(document).on('click',"#btnEfectivo",function(){
    $("#r_efectivo").val($("#efectivo").val());
    $("#d_efectivo").val(calcularDif("#efectivo","#r_efectivo"));
    $("#d_efectivo").keyup();
    $("#diferencia").val(calcularDiferencia());
    $("#diferencia").keyup();
});

$(document).on('click',"#btnCheque",function(){
    $("#r_cheque").val($("#cheque").val());
    $("#d_cheque").val(calcularDif("#cheque","#r_cheque"));
    $("#d_cheque").keyup();
    $("#diferencia").val(calcularDiferencia());
    $("#diferencia").keyup();
});

$(document).on('click',"#btnCredito",function(){
    $("#r_credito").val($("#credito").val());
    $("#d_credito").val(calcularDif("#credito","#r_credito"));
    $("#d_credito").keyup();
    $("#diferencia").val(calcularDiferencia());
    $("#diferencia").keyup();
});

$(document).on('click',"#btnDebito",function(){
    $("#r_debito").val($("#debito").val());
    $("#d_debito").val(calcularDif("#debito","#r_debito"));
    $("#d_efectivo").keyup();
    $("#diferencia").val(calcularDiferencia());
    $("#diferencia").keyup();
});