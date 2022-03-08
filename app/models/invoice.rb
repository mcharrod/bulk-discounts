class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  validates_presence_of :status

  enum status: { "in progress" => 0, "cancelled" => 1, "completed" => 2 }

  def total_revenue
    invoice_items.sum('unit_price * quantity')
  end

  def discount_info
    invoice_items.best_discounts.each_with_object({saved_money: 0}) do |invoice_item, hash|
      next if hash[invoice_item.id]# is nil

      total = invoice_item.quantity * invoice_item.unit_price
      percent_off = invoice_item.percentage.fdiv(100)
      hash[:saved_money] += total * percent_off

      hash[invoice_item.id] = invoice_item.discount
    end
  end

  def format_date
    created_at.strftime("%A, %B %d, %Y")
  end

  def self.incomplete
    where(status: 0).order(:created_at)
  end
end
