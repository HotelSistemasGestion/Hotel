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


      $(this).datepicker({format: 'yyyy-mm-dd', autoclose: true});
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
          autoSize: true

          });

   });
    
      //Java script para que nested form reconozca los <tr>
      window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
		  var $tr = $(link).closest('tr');
		  return $(content).insertBefore($tr);
		  } 


      $('#descuento,#cantidad_de_habitaciones,#dias').change(function(){
        descontartotal();
      });

      $('#total').val(getPrecioInicial());

      



  });
       //ACA COMIENZA EL CODIGO QUE AUTOSUMA TODO EN LAS VISTAS DE PRESUPUESTAR
      //Escucho los cambios en cantidad.
      $(document).on('change','#table .escuchable', function () {                
                var id = $(this).attr("id");
                actualizarsubtotal(id,-8);
            });
      //Escucho los cambios en el selector de servicios.
      $(document).on('keyup autocompletechange','#table .ui-autocomplete-input', function () {                
                var id = $(this).attr("id");
                actualizarsubtotal(id,-7);
            });

      //Cuando borro un Servicio
      $(document).on('click','#table #borrar', function () {                
                actualizartotal();
            });

    

  //Funciones
  function getPrecioInicial(){
    var dias=parseInt($("#dias").val());
    var precio_de_habitacion=parseInt($("#precio_habitacion").val());
    var cantidad_de_habitaciones=parseInt($("#cantidad_de_habitaciones").val());
    var total=dias*cantidad_de_habitaciones*precio_de_habitacion;
    return total;
  }
  function actualizarsubtotal(id,num){
        console.log("Actualizo subtotal");
        var aux=id.slice(0,num);
        var subtotal_id="#"+aux+"subtotal";
        var ayudante="#"+aux+"ayudante";
        var cantidad="#"+aux+"cantidad";
        cantidad=parseInt($(cantidad).val());
        var precio=parseInt($(ayudante).val());
        if(! isNaN(precio)) { 
          $(subtotal_id).val(precio * cantidad);
          console.log("Tengo Precio");
          actualizartotal();
        }else{
          $(subtotal_id).val(0);
          console.log("No Tengo Precio");
          actualizartotal();

        }
        
      }
    function getsumasubtotales(){
       var sum = 0;
        $(".subtotal").each(function() {
            var id=$(this).attr("id");
            var val = $(this).val();
            if ($("#" + id).parent().closest('tr').css('display') !== "none"){
              if ( val ) {
                val = parseInt(val);
                sum += !isNaN(val) ? val : 0;
            }
            }     
        });
        return sum;
    }


       function actualizartotal(){
           
            $("#total").val(getsumasubtotales());
            descontartotal();
        }
      //descontar el descuento del total
      function descontartotal(){
        var descuento;
        var subtotales=getsumasubtotales();
        if(parseInt($("#total").val() ) ==0){
          descuento=0;

        }else{
   
          descuento=((getPrecioInicial()+subtotales)* ($("#descuento").val()/100) );
        }
        $("#total").val((getPrecioInicial()+subtotales)-descuento);
      }
      ///ACA TERMINA EL CODIGO QUE AUTOSUMA TODO EN LAS VISTAS DE PRESUPUESTAR
/*-----------------------------------------------------------------*/
 
