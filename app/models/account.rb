class Account < ActiveRecord::Base
    belongs_to :client   
    validates :fecha_entrada, :fecha_salida, :client, presence: true
end
