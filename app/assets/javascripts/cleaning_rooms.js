$(document).ready(function() {

		
		$('#calendar').fullCalendar({

			 height: 600,
			//theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay,listDay,listWeek'
			},
      navLinks: true, // can click day/week names to navigate views
			businessHours: true, // display business hours
			editable: false,
			eventLimit: false,
			// customize the button names,
			// otherwise they'd all just say "list"
			views: {
				listDay: { buttonText: 'listar Dia' },
				listWeek: { buttonText: 'listar Semana' }
			},

			defaultView: 'month',	
			events: "/cleanings.json"
		
		});
          $('#sandbox-container  .input-daterange').datepicker({
});
		
	});

$(document).on('nested:fieldAdded', function(event) {
  var dateFormat = "mm/dd/yy";
      $('#sandbox-container  .input-daterange').datepicker({
});
  var dateField, field;


  field = event.field;
  dateField = field.find('.input-daterange');
  
  dateField.datepicker({
      format: 'dd/mm/yyyy'
   //  startDate: "12/12/2016"
   });

  
  // $(dateField[0]).datepicker({format: 'dd-mm-yyyy'}).on( "change", function() {
    //   $(dateField[1]).datepicker({format: 'dd-mm-yyyy', startDate: $(this).val() } );
         
      //    console.log($(this).val());
  //});
  // $(dateField[1]).datepicker({format: 'dd-mm-yyyy'}).on( "change", function() {
    
    //   $(dateField[0]).datepicker({format: 'dd-mm-yyyy',  endDate: $(dateField[1]).val() } );
         
    //       console.log($(this).val());
  //});
 //$(dateField[1]).datepicker({format: 'dd-mm-yyyy'}).on( "change", function() {
   //    $(dateField[0]).datepicker({format: 'dd-mm-yyyy', endDate: $(this).val() } );
         
    //       console.log($(this).val());
  //});
  //$(dateField[1]).datepicker({format: 'dd-mm-yyyy', minDate: "11/25/2016" } );

 // $(dateField[1]).datepicker({format: 'dd-mm-yyyy'}).on( "change", function() {
   //        // $(dateField[0]).datepicker( "option", "maxDate",  $(this).val() );
     //        console.log($(this).val());
  //});


  field.validator();

  var colorField  ,inputField;
  colorField = field.find('.colorpicker-component');
  inputField = field.find('.input');
  colorField.colorpicker({ format: "hex"});
  
  $(inputField[1]).hide();
  $(inputField[2]).hide();
  $(colorField[0]).colorpicker().on('changeColor', function(e) {
            $(inputField[0]).css({"backgroundColor" : e.color.toHex()})
            $(inputField[1]).val( e.color.toHex());
  });
  $(colorField[1]).colorpicker().on('changeColor', function(e) {
            $(inputField[0]).css({'color' : e.color.toHex()});
            $(inputField[2]).val( e.color.toHex());
  });      
       

});

