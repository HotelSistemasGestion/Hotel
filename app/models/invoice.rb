class Invoice < ActiveRecord::Base
    belongs_to :client
    validates :numero, :fecha, presence: true

    validates :client, :presence => {:message => "No puede dejar en blanco este campo"}
    
end
