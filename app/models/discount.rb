class Discount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name
  validates_presence_of :percent
  validates_presence_of :min_quantity
end
