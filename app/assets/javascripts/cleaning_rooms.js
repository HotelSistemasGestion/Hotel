$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			 height: 450,
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
				listDay: { buttonText: 'list day' },
				listWeek: { buttonText: 'list week' }
			},

			defaultView: 'month',
			defaultDate: '2016-10-12',
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
  dateField.datepicker({format: 'yyyy-mm-dd'});
  field.validator();
  //$('.datepi').validator();'option', {dateFormat: 'dd/mm/yy'}

});

