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
			
			   events: [
        {
          title: 'Habitacion1 Ruben Fernandez',
          start: '2016-10-22T14:15:00.000Z',
       
         // end: '2016-10-22T19:19:00.000Z',
          //borderColor: "red",
          //backgroundColor: "red"
          //textColor
           allDay:"true",
          //color: "red"
        },
        {
          title: 'All Day Event',
          start: '2016-10-19'
        }]
		
		});
		
	});

