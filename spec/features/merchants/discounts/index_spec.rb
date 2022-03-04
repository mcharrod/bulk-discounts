require 'rails_helper'

RSpec.describe 'merchant discount index page' do
  it 'has path' do
    merchant = create(:merchant)
    visit "/merchants/#{merchant.id}/discounts"
    expect(page).to have_content("vingus")
  end
end
