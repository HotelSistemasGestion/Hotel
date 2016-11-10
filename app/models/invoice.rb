class Invoice < ActiveRecord::Base
    belongs_to :client
    belongs_to :detail_of_cash_movement

    has_many :invoice_details

    validates :numero, :fecha, :client_id, presence: true
    attr_accessor :client

    accepts_nested_attributes_for :invoice_details, allow_destroy: true , update_only: true
end
