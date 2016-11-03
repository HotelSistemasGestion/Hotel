class AccountXEntry < ActiveRecord::Base
	belongs_to :accounting_entry
    belongs_to :accounting_account
    has_many :account_x_auto_entries

  def self.search(search)
  	if search.nil?
  		
  		find_by_sql("SELECT * FROM account_x_entries")
  		
  	else 
  		 @date_array=search.split('-')
        @s=@date_array[0]
        @e=@date_array[1]
      
  		find_by_sql("SELECT * FROM account_x_entries INNER JOIN accounting_entries ON account_x_entries.accounting_entry_id=accounting_entries.id WHERE accounting_entries.fecha BETWEEN '#{@s}' AND '#{@e}'")
  		

  		end
  	end
end
