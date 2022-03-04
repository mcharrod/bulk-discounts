require 'rails_helper'

RSpec.describe 'merchant discount index page' do
  it 'has a route and header' do
    merchant = create(:merchant)
    visit "/merchants/#{merchant.id}/discounts"
    expect(page).to have_content("Discount index")
  end

  it 'displays upcoming holidays' do
    merchant = create(:merchant)
    visit "/merchants/#{merchant.id}/discounts"

    holidays = HolidayFacade.next_holidays
    expect(page).to have_content(holidays.first.name)
  end
end
