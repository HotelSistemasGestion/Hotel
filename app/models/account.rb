class Account < ActiveRecord::Base
	audited
    belongs_to :client   
    belongs_to :room


    has_many :account_details
    has_many :room_account_details

    validates :fecha_entrada, presence: true

    attr_accessor :client
    attr_accessor :room

    accepts_nested_attributes_for :account_details, allow_destroy: true , update_only: true
    accepts_nested_attributes_for :room_account_details, allow_destroy: true , update_only: true

end
