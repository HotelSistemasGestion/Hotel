
$(function(){
$('.datatable').DataTable({
  // ajax: ...,
     autoWidth: false,
     pagingType: 'full_numbers',
     processing: true,
     serverSide: true,

  // Optional, if you want full pagination controls.
  // Check dataTables documentation to learn more about available options.
  // http://datatables.net/reference/option/pagingType
});

})

