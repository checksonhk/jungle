require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true  do
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

  scenario "Can add products to cart from homepage" do
    # ACT
    visit "http://localhost:3000/signup"

    #add cart which leads to login screen
    # first('form.button_to').click_button
    
    #login 
    fill_in "user[name]", with: 123
    fill_in "user[email]", with: "123@me.com"
    fill_in "user[password]", with: "asd"
    fill_in "user[password_confirmation]", with: "asd"
    find("#new_user").click_button
    
    visit "http://localhost:3000/login"

    fill_in "session[email]", with: "123@me.com"
    fill_in "session[password]", with: "asd"
    find("#new_session").click_button
    
    #add to cart
    first('form.button_to').click_button
    
    # byebug
    
    # VERIFY
    find("ul.navbar-right") {
      expect(page).to have_content("My Cart (1)")
    }
    save_screenshot
  end
end
