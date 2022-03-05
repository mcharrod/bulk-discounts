class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name
  validates_presence_of :percent
  validates_presence_of :min_quantity
  validates :percent, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :min_quantity, numericality: { greater_than_or_equal_to: 0 }


  def valid_data?
    self.percent < 100 && self.min_quantity > 1
  end
end
