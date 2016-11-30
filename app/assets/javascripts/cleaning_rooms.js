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

     //permite el rango entre dos datepicker 
     $('#sandbox-container  .input-daterange').datepicker({});
     $('.fancybox').fancybox();
        $(' .input-daterange').datepicker({  format: 'dd/mm/yyyy', calendarWeeks: true});
    
      
          
		
	});

$(document).on('nested:fieldAdded', function(event) {
  var dateFormat = "mm/dd/yy";
  var dateField, field;
  $('#sandbox-container  .input-daterange').datepicker({});



  field = event.field;
  dateField = field.find('.input-daterange');
  
  dateField.datepicker({
      format: 'dd/mm/yyyy'
   //  startDate: "12/12/2016"
   });



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
$(document).ready(function(){
       
        $('#calendario').fullCalendar({


       height: 500,

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
      events: "/reservation_rooms.json"
    
    
    });
  $('#myModal').on('shown.bs.modal', function () {
   width:1000,
   $("#calendario").fullCalendar('render');
      });

 });

