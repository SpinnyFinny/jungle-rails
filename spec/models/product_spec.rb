require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.new
      @product = Product.new(name:'Finn', price: 1000, quantity: 2, category: @category)
    end
    
    it 'should be valid' do
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @product.name = nil
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to eq ['Name can\'t be blank']
    end

    it 'is not valid without a price' do
      @product.price_cents = nil
      expect(@product).not_to be_valid
    end

    it 'is not valid without a quantity' do
      @product.quantity = nil
      expect(@product).not_to be_valid
    end

    it 'is not valid without a category' do
      @product.category = nil
      expect(@product).not_to be_valid
    end

  end

end
