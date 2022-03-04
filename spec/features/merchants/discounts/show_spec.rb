require 'rails_helper'

describe 'discount show page' do
  it 'does thing' do
    merchant1 = create(:merchant)

    discount1 = create(:discount, merchant: merchant1)
    visit "/merchants/#{merchant1.id}/discounts/#{discount1.id}"

    expect(page).to have_content(discount1.name)
    expect(page).to have_content("Percent off: #{discount1.percent}")
    expect(page).to have_content("Minimum purchase quantity: #{discount1.min_quantity}")
  end
end
