require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

     # SETUP
     before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
    

    scenario "successfully navigates to the product page when you click on a product" do
    visit root_path
    # puts page.html
    
      
    # click_on('/products/1', visible false)
    find("a[href='/products/2']", match: :first).trigger('click')

    
    expect(page).to have_css '.product-detail', count: 1
    puts page.html
    save_screenshot
  

    end
    

end
