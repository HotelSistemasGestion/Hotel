# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#example').DataTable
    'scrollX': true
    'language': 'url': '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json'
  return