require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'attributes' do
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :unit_price }
    it { should validate_presence_of :status }
  end

  it 'exists' do
    ii = create(:invoice_item)

    expect(ii).to be_a(InvoiceItem)
    expect(ii).to be_valid
  end

  describe 'relationships' do
    it { should belong_to(:item) }
    it { should belong_to(:invoice) }
    it { should have_many(:transactions).through(:invoice) }
  end
  
  describe 'thing' do
    it 'works' do
      merchant1 = create(:merchant)

      item1 = create(:item, merchant: merchant1)
      invoice1 = create(:invoice)

      ii1 = create(:invoice_item, quantity: 3, unit_price: 1000, item: item1, invoice: invoice1)
      ii2 = create(:invoice_item, quantity: 5, unit_price: 1000, item: item1, invoice: invoice1)
      ii3 = create(:invoice_item, quantity: 1, unit_price: 1000, item: item1, invoice: invoice1)

      discount1 = create(:discount, min_quantity: 3, percent: 10, merchant: merchant1)
      discount2 = create(:discount, min_quantity: 4, percent: 20, merchant: merchant1)

      invoice1.invoice_items.best_discounts
    end
  end
end
