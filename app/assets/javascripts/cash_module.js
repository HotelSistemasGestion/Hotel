

$(document).on("change", ".select", function(){
        var id = "#"+$(this).attr("id");
        var id2 = $(id).siblings(".cheque");
        console.log(id2);
        mostrarCheque(id);
    });
		
function mostrarCheque(id){
	if ($(id).val() == "2") {
    	$(".cheque").show();
    } else {
  	    $(".cheque").hide();
    }
}
      

