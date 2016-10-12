class Account < ActiveRecord::Base
    belongs_to :client   
    validates :fecha_entrada, presence: true

    validates :client, :presence => {:message => "No puede dejar en blanco este campo"}

    delegate :nombre, to: :client, prefix: true, allow_nill: true

end
