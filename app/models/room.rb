class Room < ActiveRecord::Base
  belongs_to :type_of_room
  belongs_to :state

  has_many :room_comforts
  has_many :accounts

  validates :identificador, presence: true

  delegate :tipo, to: :type_of_room, prefix: true, allow_nil: true
  delegate :descripcion, to: :state, prefix: true, allow_nil: true

  accepts_nested_attributes_for :room_comforts ,:allow_destroy => true

end 
