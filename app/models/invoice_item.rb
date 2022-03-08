class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  has_many :transactions, through: :invoice
  has_one :merchant, through: :item
  has_many :discounts, through: :merchant

  validates_presence_of :quantity
  validates_presence_of :unit_price
  validates_presence_of :status


  enum status: { "packaged" => 0, "pending" => 1, "shipped" => 2 }
  
    scope :best_discounts, -> {
      joins(item: :discounts)
        .where('invoice_items.quantity >= discounts.min_quantity')
        .select('invoice_items.*, discounts.id AS discount, discounts.percent AS percentage')
        .order(percentage: :desc)
    }
end
