class Invoice < ActiveRecord::Base
    belongs_to :client
    validates :numero, :fecha, presence: true
end
