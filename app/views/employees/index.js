<% js = escape_javascript(
  render(partial: 'employees/list_index', locals: { employees: @employees })
) %>
$("#filterrific_results").html("<%= js %>");