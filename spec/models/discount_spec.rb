require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :min_quantity }
    it { should validate_presence_of :percent }
  end

  xit 'range validation' do
    merchant = create(:merchant)
    invalid_discount = Discount.create!(percent: 200, min_quantity: 2, name: "negative discount", merchant_id: merchant.id)
    expect(valid_data?(invalid_discount.params)).to eq(false)
  end
end
