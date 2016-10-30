class CleaningRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :employee
  has_many :cleanings, :dependent => :destroy
  delegate :identificador, to: :room, prefix: true, allow_nil: true
   delegate :nombre, to: :employee, prefix: true, allow_nil: true
  accepts_nested_attributes_for :cleanings ,:allow_destroy => true, update_only: true
end
