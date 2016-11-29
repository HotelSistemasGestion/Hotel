<% js = escape_javascript(
  render(partial: 'rooms/list_index', locals: { rooms: @rooms })
) %>
$("#filterrific_results").html("<%= js %>");