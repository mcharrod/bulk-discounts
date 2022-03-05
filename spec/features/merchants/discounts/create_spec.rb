require 'rails_helper'

describe 'discount creation' do
  before do
    @merchant1 = create(:merchant)
  end
  it 'links from the merchant discounts index' do

    visit "/merchants/#{@merchant1.id}/discounts"

    expect(page).to have_link("Create discount")
    click_link("Create discount")

    expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts/new")
  end

  it 'form makes a new discount' do
    visit "/merchants/#{@merchant1.id}/discounts/new"

    fill_in "Discount name:", with: "Happy people discount"
    fill_in "Percent off:", with: 20
    fill_in "Minimum purchase quantity:", with: 10

    click_button("Save")
    expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts")
    expect(page).to have_content("Happy people discount")
  end

  it 'form invalid data flashes error messages' do
    visit "/merchants/#{@merchant1.id}/discounts/new"

    fill_in "Percent off:", with: 200
    fill_in "Minimum purchase quantity:", with: -1

    click_button("Save")
    
    expect(page).to have_content("Error: Name can't be blank")
    expect(page).to have_content("Percent must be less than or equal to 100")
    expect(page).to have_content("Min quantity must be greater than or equal to 0")
  end
end
