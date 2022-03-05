require 'rails_helper'

describe 'discount edit' do
  it 'page has a form pre-populated with current information' do
    merchant1 = create(:merchant)
    discount1 = create(:discount, merchant: merchant1)
    visit "/merchants/#{merchant1.id}/discounts/#{discount1.id}/edit"

    expect(page).to have_field("Discount name:", with: discount1.name)
    expect(page).to have_field("Percent off:", with: discount1.percent)
    expect(page).to have_field("Minimum purchase quantity:", with: discount1.min_quantity)
  end

  it 'updates the item' do
    merchant1 = create(:merchant)
    discount1 = create(:discount, merchant: merchant1)
    visit "/merchants/#{merchant1.id}/discounts/#{discount1.id}/edit"

    fill_in "Discount name:", with: "BOGO"

    click_button("Save")
    expect(current_path).to eq("/merchants/#{merchant1.id}/discounts/#{discount1.id}")

    expect(page).to have_content("BOGO")
  end
end
