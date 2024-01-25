require 'rails_helper'

# spec/models/account_spec.rb

RSpec.describe Account, type: :model do
  it 'is not valid without a username' do
    account = Account.create(
      password: 'securepassword',
      email: 'user@example.com'
    )
    expect(account.errors[:username]).to_not be_empty
  end

  it 'is not valid without a password' do
    account = Account.create(
      username: 'user123',
      email: 'user@example.com'
    )
    expect(account.errors[:password]).to_not be_empty
  end

  it 'is not valid without an email' do
    account = Account.create(
      username: 'user123',
      password: 'securepassword'
    )
    expect(account.errors[:email]).to_not be_empty
  end

  it 'requires a username to be at least 5 characters long' do
    account = Account.create(
      username: 'user',
      password: 'securepassword',
      email: 'user@example.com'
    )
    expect(account.errors[:username]).to_not be_empty
  end

  it 'requires a password to be at least 6 characters long' do
    account = Account.create(
      username: 'user123',
      password: 'pass',
      email: 'user@example.com'
    )
    expect(account.errors[:password]).to_not be_empty
  end

  it 'does not allow duplicate usernames' do
    Account.create(
      username: 'user123',
      password: 'securepassword',
      email: 'user@example.com'
    )
    account = Account.create(
      username: 'user123',
      password: 'anotherpassword',
      email: 'anotheruser@example.com'
    )
    expect(account.errors[:username]).to_not be_empty
  end

  it 'does not allow duplicate passwords' do
    Account.create(
      username: 'user123',
      password: 'securepassword',
      email: 'user@example.com'
    )
    account = Account.create(
      username: 'anotheruser',
      password: 'securepassword',
      email: 'anotheruser@example.com'
    )
    expect(account.errors[:password]).to_not be_empty
  end
end