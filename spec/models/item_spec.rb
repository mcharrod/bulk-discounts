require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'attributes' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :unit_price }
  end

  it 'exists' do
    item = create(:item)
    expect(item).to be_a(Item)
    expect(item). to be_valid
  end

  describe 'relationships' do
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices).through(:invoice_items) }
    it { should have_many(:transactions).through(:invoices) }
  end
end