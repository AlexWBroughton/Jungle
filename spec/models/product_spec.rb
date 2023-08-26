require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    before(:each) do
      @category = Category.create(name: 'Example Category')
    end

    it 'is valid with all required attributes' do
      @product = Product.new(name: 'Example Product', price: 10.99, quantity: 5, category: @category)
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @product = Product.new(price: 10.99, quantity: 5, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @product = Product.new(name: 'Example Product', quantity: 5, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @product = Product.new(name: 'Example Product', price: 10.99, category: @category)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @product = Product.new(name: 'Example Product', price: 10.99, quantity: 5)
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
