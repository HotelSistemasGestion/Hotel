class AccountXEntry < ActiveRecord::Base
	belongs_to :accounting_entry
    belongs_to :accounting_account
    has_many :account_x_auto_entries

  def self.search_conta(search_conta)
  	if search_conta.nil?
      @time=Time.now
      @arr=@time.strftime("%d/%m/%Y").to_date.to_s		
  		find_by_sql("SELECT * FROM account_x_entries INNER JOIN accounting_entries ON account_x_entries.accounting_entry_id=accounting_entries.id WHERE accounting_entries.fecha='#{@arr}'")
  		
  	else 
  		 @date_array=search_conta.split('-')
        @s=@date_array[0].to_date.to_s
        @e=@date_array[1].to_date.to_s
      
  		find_by_sql("SELECT * FROM account_x_entries INNER JOIN accounting_entries ON account_x_entries.accounting_entry_id=accounting_entries.id WHERE accounting_entries.fecha BETWEEN '#{@s}' AND '#{@e}'")
  		

  		end
  	end
end
