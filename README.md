# The application data should be managed by a PostgreSQL database in a Rails application.
rails new rails-validations -d postgresql -T
cd rails-validations
bundle add rspec-rails
rails generate rspec:install


# The model should be called Account with username, password, and email attributes.
rails generate model Account username:string password:string eamil:string 

# Every account should require entries for username, password, and email.
validates :username, :password, :email, presence: true

# Every username should be at least five (5) characters long.
validates :username, length: { minimum: 5 }, uniqueness: true

# Every username should be unique.
validates :username, length: { minimum: 5 }, uniqueness: true

# Every password should be at least six (6) characters long.
validates :password, length: { minimum: 6 }, uniqueness: true
  
# Every password should be unique.
validates :password, length: { minimum: 6 }, uniqueness: true
  
# The Account model has an associated model called Addresses where an account can have many addresses.
has_many :addresses

# The Address model should have a street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
validates :street_number, presence: true, numericality: { only_integer: true } 

# Every address should require entries for street_number, street_name, city, state, and zip.
validates :zip, presence: true, numericality: { only_integer: true }