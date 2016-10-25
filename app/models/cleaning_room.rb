class CleaningRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :employee
  delegate :identificador, to: :room, prefix: true, allow_nil: true
   delegate :nombre, to: :employee, prefix: true, allow_nil: true
end
