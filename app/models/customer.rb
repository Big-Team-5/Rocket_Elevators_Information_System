class Customer < ApplicationRecord
    belongs_to :user
    belongs_to :address
    has_many :building
    has_many :quote_form
end
