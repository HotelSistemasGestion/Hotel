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

  jQuery(document).ready(function($) {

  function doAnimations( elems ) {
    //Cache the animationend event in a variable
    var animEndEv = 'webkitAnimationEnd animationend';
    
    elems.each(function () {
      var $this = $(this),
        $animationType = $this.data('animation');
      $this.addClass($animationType).one(animEndEv, function () {
        $this.removeClass($animationType);
      });
    });
  }
  
  //Variables on page load 
  var $myCarousel = $('#carousel-example-generic'),
    $firstAnimatingElems = $myCarousel.find('.item:first').find("[data-animation ^= 'animated']");
    
  //Initialize carousel 
  $myCarousel.carousel();
  
  //Animate captions in first slide on page load 
  doAnimations($firstAnimatingElems);
  
  //Pause carousel  
  $myCarousel.carousel('pause');
  
  
  //Other slides to be animated on carousel slide event 
  $myCarousel.on('slide.bs.carousel', function (e) {
    var $animatingElems = $(e.relatedTarget).find("[data-animation ^= 'animated']");
    doAnimations($animatingElems);
  });  
    $('#carousel-example-generic').carousel({
        interval:3000,
        pause: "false"
    });
  
})
$(document).ready(function() {
    $("#single_1").fancybox({
          helpers: {
              title : {
                  type : 'float'
              }
          }
      });
 });
  jQuery(document).ready(function($) {
       
        $('#myCarousel').carousel({
                interval: 5000
        });
 
        //Handles the carousel thumbnails
        $('[id^=carousel-selector-]').click(function () {
        var id_selector = $(this).attr("id");
        try {
            var id = /-(\d+)$/.exec(id_selector)[1];
            console.log(id_selector, id);
            jQuery('#myCarousel').carousel(parseInt(id));
        } catch (e) {
            console.log('Regex failed!', e);
        }
    });
        // When the carousel slides, auto update the text
        $('#myCarousel').on('slid.bs.carousel', function (e) {
                 var id = $('.item.active').data('slide-number');
                $('#carousel-text').html($('#slide-content-'+id).html());
        });
        $( '.item:first' ).addClass( 'active');
});
