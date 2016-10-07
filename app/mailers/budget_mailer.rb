class BudgetMailer < ApplicationMailer
  default :from => 'no-reply@example.com',
          :subject => 'An email sent via Hotel Uni'

  def budget_email
    mail :to => %w(matias.gonzalez95@hotmail.com)
  end
end
