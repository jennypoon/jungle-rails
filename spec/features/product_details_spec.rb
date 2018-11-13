require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They see the detail page when click on image" do
    # ACT
    visit root_path

    first(:css, 'img').click

    # DEBUG
    save_screenshot 'product-detail.png'

    # VERIFY
    expect(page).to have_text @category.products.first.name
  end

  scenario "They see the detail page when click on product name" do
    # ACT
    visit root_path

    click_link(@category.products.first.name)

    # DEBUG
    sleep 2
    save_screenshot 'product-detail.png'

    # VERIFY
    expect(page).to have_text @category.products.first.name

  end

end
