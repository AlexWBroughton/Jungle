require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        email: 'test@example.com',
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      user = User.new(
        email: 'test@example.com',
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'different_password'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid without a password and password_confirmation' do
      user = User.new(
        email: 'test@example.com',
        first_name: 'John',
        last_name: 'Doe'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'is not valid if email is not unique (case-insensitive)' do
      User.create(
        email: 'test@example.com',
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'password'
      )
      user = User.new(
        email: 'TEST@example.com',
        first_name: 'Jane',
        last_name: 'Smith',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it 'is not valid without an email, first name, and last name' do
      user = User.new(
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
      expect(user.errors.full_messages).to include("First name can't be blank")
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'is not valid with a password shorter than 6 characters' do
      user = User.new(
        email: 'test@example.com',
        first_name: 'John',
        last_name: 'Doe',
        password: 'short',  # Password length less than 6 characters
        password_confirmation: 'short'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns user instance if authentication is successful' do
      user = User.create(
        email: 'test@example.com',
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'password'
      )
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end
    it 'returns nil if email is incorrect' do
      user = User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
      authenticated_user = User.authenticate_with_credentials('wrong@example.com', 'password')
      expect(authenticated_user).to be_nil
    end

    it 'returns nil if password is incorrect' do
      user = User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'wrong_password')
      expect(authenticated_user).to be_nil
    end
    it 'returns user instance with case-insensitive email' do
      user = User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
      authenticated_user = User.authenticate_with_credentials('TEST@EXAMPLE.COM', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'returns user instance with email containing extra spaces' do
      user = User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
      authenticated_user = User.authenticate_with_credentials('  test@example.com  ', 'password')
      expect(authenticated_user).to eq(user)
    end
  end
end
