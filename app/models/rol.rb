class Rol < ActiveRecord::Base
  has_many :users
  has_many :rol_actions
  has_many :actions, through: :rol_actions
end
