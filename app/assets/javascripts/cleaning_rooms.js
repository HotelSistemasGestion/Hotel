$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			 height: 650,
			//theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'listDay,month,agendaWeek,agendaDay,listDay,listWeek'
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
			defaultDate: '2016-09-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: '/cleaning_rooms.json'
		
		});
		
	});

