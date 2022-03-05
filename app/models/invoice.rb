class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates_presence_of :status

  enum status: { "in progress" => 0, "cancelled" => 1, "completed" => 2 }



  def total_revenue
    invoice_items.sum('unit_price * quantity')
  end

  def format_date
    created_at.strftime("%A, %B %d, %Y")
  end

  def self.incomplete
    # Invoice.where.not(status: 1).joins(:invoice_items).where.not(status: 2).group("invoices.id")
    where(status: 0).order(:created_at)
  end
end
