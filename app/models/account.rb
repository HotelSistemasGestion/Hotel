class Account < ActiveRecord::Base
    belongs_to :client   
    belongs_to :room

    has_many :account_details

    validates :fecha_entrada, presence: true

    validates :client, :presence => {:message => "No puede dejar en blanco este campo"}

    delegate :nombre, to: :client, prefix: true, allow_nill: true

    delegate :identificador, to: :room, prefix: true, allow_nill: true

    accepts_nested_attributes_for :account_details, allow_destroy: true , update_only: true

end
