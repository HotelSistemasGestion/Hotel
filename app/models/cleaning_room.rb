class CleaningRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :employee
end
