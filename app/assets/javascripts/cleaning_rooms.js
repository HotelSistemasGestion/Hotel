$(document).ready(function() {

		
		$('#calendar').fullCalendar({

			 height: 600,
			//theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listDay,listWeek'
			},
            navLinks: true, // can click day/week names to navigate views
			businessHours: true, // display business hours
			editable: true,
			eventLimit: true,
			// customize the button names,
			// otherwise they'd all just say "list"
			views: {
				listDay: { buttonText: 'listar Dia' },
				listWeek: { buttonText: 'listar Semana' }
			},

			defaultView: 'month',
			
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: "/cleanings.json"
		
		});
		
	});

$(document).on('nested:fieldAdded', function(event) {
  var dateField, field;
  field = event.field;
  dateField = field.find('.datepicker');
  dateField.datepicker({
  	format: 'dd-mm-yyyy'});
  field.validator();
  var colorField  ,inputField;
  colorField = field.find('.colorpicker-component');
  inputField = field.find('.input');
  colorField.colorpicker({ format: "hex"});
   $(inputField[1]).hide();
  $(colorField[0]).colorpicker().on('changeColor', function(e) {
            $(inputField[0]).css({"backgroundColor" : e.color.toHex()})
            $(inputField[1]).val( e.color.toHex());
  });
  $(colorField[1]).colorpicker().on('changeColor', function(e) {
            $(inputField[0]).css({'color' : e.color.toHex()});

  });

  //$('.datepi').validator();'option', {dateFormat: 'dd/mm/yy'}
      
       

});

