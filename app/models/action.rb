class Action < ActiveRecord::Base  
  has_many :rol_actions
  has_many :rols, through: :rol_actions
end
