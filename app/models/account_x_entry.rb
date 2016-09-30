class AccountXEntry < ActiveRecord::Base
	belongs_to :accounting_entry
    belongs_to :accounting_account
    has_many :account_x_auto_entries
end
