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

      

      $('input[name="daterange"]').daterangepicker({
        });

      $('#descuento,#cantidad_de_habitaciones,#dias').change(function(){
        descontartotal();
      });

      $('#total').val(getPrecioInicial());

       $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
          $(this).val('');
        });

  });
       //ACA COMIENZA EL CODIGO QUE AUTOSUMA TODO EN LAS VISTAS DE PRESUPUESTAR
      //Escucho los cambios en cantidad.
      $(document).on('change','#table .escuchable', function () {                
                var id = $(this).attr("id");
                actualizarsubtotal(id,-8);
            });
      //Escucho los cambios en el selector de servicios.
      $(document).on('keyup','#table .ui-autocomplete-input', function () {                
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
        var aux=id.slice(0,num);
        var subtotal_id="#"+aux+"subtotal";
        var ayudante="#"+aux+"ayudante";
        var cantidad="#"+aux+"cantidad";
        cantidad=parseInt($(cantidad).val());
        var precio=parseInt($(ayudante).val());
        if(! isNaN(precio)) { 
          $(subtotal_id).val(precio * cantidad);
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
  

/*-----------------------------------------------------------------*/
  function showF(str1,str2) {
    var xhttp;    
    if (str1 == ""&& str2=="") {
      document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };
  console.log(str1+"-"+str2)
}

/*-----------------------------------------------------------------*/
  $('input[name="datefilter"]').daterangepicker({
      autoUpdateInput: false,
      dateFormat: 'DD/MM/YYYY',
      showOn: 'button',   
      locale: {
          cancelLabel: 'Clear'
      }
  });

/*-----------------------------------------------------------------*/

  $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
    var date_select=  $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
    var date_array=date_select.val().split("-");
    var date_start=date_array[0];
    var date_end=date_array[1];
    $.ajax({
      url: "diary_book/diario",
      type: 'POST',})
  });
      


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
 
