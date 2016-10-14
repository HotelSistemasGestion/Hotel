class BudgetMailer < ApplicationMailer
  default :from => 'example@example.com',
          :subject => 'Presupuesto de Pedido de Reservas'

  def budget_email(budget)
  	@budget = budget
  	@reservation_request = ReservationRequest.find(@budget.reservation_request_id)
  	@budget_details = BudgetDetail.where('budget_id': @budget.id)
    mail :to => @budget.email
  end
end
