require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category){
      Category.create(name: "temp")
    }

    subject do 
      Product.new(name: "temp",price_cents: 15, quantity: 5, category: category)
    end
    
    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  
    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
  
    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
  
    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end

  end
end
