class BudgetMailer < ApplicationMailer
  default :from => 'example@example.com',
          :subject => 'Presupuesto de Pedido de Reservas'

  def budget_email(budget)
  	@budget = budget
  	@reservation_request = ReservationRequest.find(@budget.reservation_request_id)
  	@budget_room_details = BudgetRoomDetail.where('budget_id': @budget.id)
  	@budget_service_details = BudgetServiceDetail.where('budget_id': @budget.id)
    mail :to => @reservation_request.email
  end
end
