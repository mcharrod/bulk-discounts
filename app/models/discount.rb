class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name
  validates_presence_of :percent
  validates_presence_of :min_quantity

  def valid_data?
    self.percent < 100 && self.min_quantity > 1
  end
end
