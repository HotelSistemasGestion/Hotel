
$(document).ready(function (){
        $('div#budgets #budget_check_in').change(function(){
           $("table.services").find('tr.fields:visible').each(function(){ 
            checkDisponibility($(this));
          });
        });
        $('div#budgets #budget_check_out').change(function(){
          $("table.services").find('tr.fields:visible').each(function(){ 
            checkDisponibility($(this));
          });
        });
        $('div#budgets #budget_comfort_id').change(function(){
          $(".table.services").find('tr.fields:visible').each(function(){ 
            checkDisponibility($(this));
          });
        });
        $('div#budgets #descuento').change(function(){
           actualizartotal();
        });

        $('div#budgets #total').val(getPrecioInicial());



      });
      
        $(document).on('nested:fieldAdded','div#budgets form', function(event) {
       //$("form").live("nested:fieldAdded", function(event) {
          console.log("Agregado");
         $(event.target).find(':input').enableClientSideValidations();
        });


      //ACA COMIENZA EL CODIGO QUE AUTOSUMA TODO EN LAS VISTAS DE PRESUPUESTAR    
      $(document).on('click','div#budgets #table #my_button', function () { 
        var $tr =  $(this).closest('tr'); 
        checkDisponibility($tr);
      });
      //Escucho los cambios en cantidad.
      $(document).on('change','div#budgets #table .escuchable', function () {                
        var id = $(this).attr("id");
        actualizarsubtotal(id,-8);
        var $tr =  $(this).closest('tr'); 
        checkDisponibility($tr);
      });
      //Escucho los cambios en el selector de servicios.
      $(document).on('focusout keyup autocompletechange','div#budgets #table .ui-autocomplete-input', function () {                
        var id = $(this).attr("id");
        actualizarsubtotal(id,-7);
        actualizarsubtotal(id,-12);
        var $tr =  $(this).closest('tr'); 
        checkDisponibility($tr);
      });

      //Cuando borro un Servicio
      $(document).on('click','div#budgets #table #borrar', function () {                
        actualizartotal();
      });
    
 
  //Funciones

  //Checkea La disponibilidad
  function checkDisponibility(my_tr){
        var $tr=my_tr;

        var mybutton=$tr.find("#my_button");
        var check_in=$("#budget_check_in").val();
        var check_out=$("#budget_check_out").val();
        var comfort_id=parseInt($("#budget_comfort_id").val());
        var type_of_room_id= parseInt($tr.find(".type_of_room").val());
        var cantidad = parseInt($tr.find('.escuchable').val()); 
        //Ve si tiene todos los datos para llamar al ajax
        if(!isNaN(comfort_id) && !isNaN(type_of_room_id) && !isNaN(cantidad)  && ($("#budget_check_out").val().length > 0) && ($("#budget_check_in").val().length > 0)){
          $.ajax({
            type:"GET",
            url:"/budgets/hay_disponible",
            my_button: mybutton,
            dataType:"json",
            data: { "cantidad" : cantidad ,
                    "type_of_room_id" : type_of_room_id,
                    "comfort_id" : comfort_id,
                    "check_in" : check_in ,
                    "check_out" : check_out},
            success:function(result){
              if (result["result"]===true){
                  this.my_button.removeClass(this.my_button.attr("class")).addClass('btn btn-success');
                  this.my_button.find("span").removeClass(this.my_button.find("span").attr("class")).addClass('glyphicon glyphicon-ok-circle');
              }
              if (result["result"] ===false){
                 this.my_button.removeClass(this.my_button.attr("class")).addClass('btn btn-danger');
                 this.my_button.find("span").removeClass(this.my_button.find("span").attr("class")).addClass('glyphicon glyphicon-remove-circle');
              }
            },error: function(result) {
              this.my_button.removeClass(this.my_button.attr("class")).addClass('btn btn-primary');
              this.my_button.find("span").removeClass(this.my_button.find("span").attr("class")).addClass('glyphicon glyphicon-calendar');
        }
          });
        }else{
          mybutton.removeClass(mybutton.attr("class")).addClass('btn btn-primary');
          mybutton.find("span").removeClass(mybutton.find("span").attr("class")).addClass('glyphicon glyphicon-calendar');

        }
      }



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
