class AddServicioToInvoiceDetails < ActiveRecord::Migration
  def change
  	add_column :invoice_details, :servicio, :string
  end
end
