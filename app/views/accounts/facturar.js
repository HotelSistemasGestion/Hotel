$('<%= j render "facturar_cuenta", title: "Facturacion" %>').on('hidden.bs.modal', function (e) {
  $(this).remove();
  $('.modal-backdrop').remove();
}).modal();