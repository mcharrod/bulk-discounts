require 'rails_helper'

RSpec.describe 'merchant discount index page' do
  it 'has links to each discounts show page' do
    merchant = create(:merchant)
    discount1 = create(:discount, merchant: merchant)
    discount2 = create(:discount, merchant: merchant)

    visit "merchants/#{merchant.id}/discounts"

    within "#discount-#{discount1.id}" do
      click_link("View this discount")
    end

    expect(current_path).to eq("/merchants/#{merchant.id}/discounts/#{discount1.id}")
  end

  it 'displays upcoming holidays' do
    merchant = create(:merchant)
    visit "/merchants/#{merchant.id}/discounts"

    holidays = HolidayFacade.next_holidays
    expect(page).to have_content(holidays.first.name)
  end

  it 'displays names of all discounts for a particular merchant' do
    merchant = create(:merchant)
    discount1 = create(:discount, merchant: merchant)
    discount2 = create(:discount, merchant: merchant)

    unrelated_merchant = create(:merchant)
    unrelated_discount = create(:discount, merchant: unrelated_merchant)

    visit "/merchants/#{merchant.id}/discounts"

    expect(page).to have_content(discount1.name)
    expect(page).not_to have_content(unrelated_discount.name)
  end
end
