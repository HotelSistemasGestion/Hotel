function miselect(){
   $("#type_room").click(function(){
     $.ajax({
        dataType: "JSON",
        timeout: 10000,
        success: function(op){//opcion
           if(op){
              $("#room").html('<select>funciona</select>');
           }
        }
     })
  });
};
$(document).ready(function(){
   miselect();
});