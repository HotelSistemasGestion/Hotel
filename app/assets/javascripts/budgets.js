      $(document).ready(function (){  
        
        $('#descuento,#cantidad_de_habitaciones,#dias').change(function(){
           actualizartotal();
        });    
        $('#total').val(getPrecioInicial());
        $('#totales').val(getPrecioInicial());

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

      $(document).on('change','#table_totals #descount', function () {     
        actualizartotal();
      });

      $(document).on('keyup','#table_totals #descount', function () {                
        actualizartotal();
      });

  function getPrecioInicial(){    
    var total=0;
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
        }
        else{
          $(subtotal_id).val(0);
          console.log(precio);
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
      //Actualiza el total con su respectivo descuento.
      function actualizartotal(){
        console.log("Estoy descontando");
        var val=(parseInt($("#descuento").val())/100);
        var desc_value=!isNaN(val) ? val : 0;
        var subtotales=getsumasubtotales();
        var descuento=((getPrecioInicial()+subtotales) *  desc_value);
        $("#total").val(( getPrecioInicial()+subtotales) - descuento);
        var val2=(parseInt($("#descount").val())/100);
        var desc_val=!isNaN(val2) ? val2 : 0;
        var d=((getPrecioInicial()+subtotales) *  desc_val);
        $("#totales").val(( getPrecioInicial()+subtotales) - d);
      }
      ///ACA TERMINA EL CODIGO QUE AUTOSUMA TODO EN LAS VISTAS DE PRESUPUESTAR
/*-----------------------------------------------------------------*/     