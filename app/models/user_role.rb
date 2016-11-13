class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :rol
end
