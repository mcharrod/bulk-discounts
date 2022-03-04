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

  it 'page has a form for discount info' do
    visit "/merchants/#{@merchant1.id}/discounts/new"

    fill_in "Discount name:", with: "Happy people discount"
    fill_in "Percent off:", with: 20
    fill_in "Minimum purchase quantity:", with: 10

    click_button("Save")
    save_and_open_page
    expect(current_path).to eq("/merchants/#{@merchant1.id}/discounts")
    expect(page).to have_content("Happy people discount")
  end
end
