class AccountXAutoEntry < ActiveRecord::Base
	belongs_to :account_x_entry
	has_many :account_x_auto_entry_dets
end
