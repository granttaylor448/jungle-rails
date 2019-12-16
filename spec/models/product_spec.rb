require 'rails_helper'



RSpec.describe Product, type: :model do
  describe 'Validations:' do
    it "has a name" do
      cat1 = Category.find_or_create_by name: 'Apparel'
      
      product1 = cat1.products.create({
        name:  'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      })

    
    expect(product1.name).should_not be_nil
    expect(product1.price).should_not be_nil
    expect(product1.quantity).should_not be_nil
    expect(product1.category.name).should_not be_nil
    expect(product1.errors).to be_empty
    end
    
    it "doesn't have a price" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      
      product1 = cat1.products.create({
        name: 'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: nil
      })
      
      expect(product1).to_not be_valid
      expect(product1.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]

    end
    it "doesnt have a quantity" do
      cat1 = Category.find_or_create_by name: 'Apparel'
      
      product1 = cat1.products.create({
        name:  'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        quantity: nil,
        price: 64.99,
      })

    
    expect(product1).to_not be_valid
    expect(product1.errors.full_messages).to eq ["Quantity can't be blank"]
    end
    it "doesn't have a category" do
      cat1 = Category.find_or_create_by! name: nil
      
      product1 = cat1.products.create({
        name:  'Men\'s Classy shirt',
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        category_id: nil
      })

    
      expect(cat1.name == nil)
      
    
    end
    it "doesnt have a name" do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      
      product1 = cat1.products.create({
        name:  nil,
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      })
      
      expect(product1).to_not be_valid
      expect(product1.errors.full_messages).to eq ["Name can't be blank"]
      
    end
  end
end
    
