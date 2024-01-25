class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
    validates :username, length: { minimum: 5 }, uniqueness: true
    validates :password, length: { minimum: 6 }, uniqueness: true
  
    has_many :addresses
end   


