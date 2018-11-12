require 'rails_helper'


RSpec.describe Product, type: :model do

    let(:category) { Category.new(name: "Food") }

    subject { Product.new(
                  name: "MangoYummy",
                  price_cents: 399,
                  quantity: 4,
                  category: category
              )}

  describe 'Validations' do
    it "is not valid without a valid name" do
      subject.name = nil
      puts subject.name
      expect(subject).to_not be_valid
    end

    it "is not valid with a valid price" do
      subject.price_cents = nil
      puts subject.price_cents
      expect(subject).to_not be_valid
    end

    it "is valid with a valid quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is valid with a valid category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end

    it "is valid with valid attributes" do
      puts subject.category.name
      expect(subject).to be_valid
    end

  end
end