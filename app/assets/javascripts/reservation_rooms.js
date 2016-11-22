$(document).ready(function() {

		
		$('#calendario_reserva').fullCalendar({

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
			events: "/reservation_rooms.json"
    
		
		});
		
	});
