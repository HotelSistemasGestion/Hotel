class Invoice < ActiveRecord::Base
    belongs_to :client
    validates :numero, :fecha, :client, presence: true
    attr_accessor :client
end
