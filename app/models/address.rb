class Address < ApplicationRecord
  belongs_to :account
  validates :street_number, presence: true, numericality: { only_integer: true } 
  validates :street_name, :city, :state, presence: true
  validates :zip, presence: true, numericality: { only_integer: true }
end
