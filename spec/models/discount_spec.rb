require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :min_quantity }
    it { should validate_numericality_of(:min_quantity).is_greater_than_or_equal_to(0) }

    it { should validate_presence_of :percent }
    it { should validate_numericality_of(:percent).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:percent).is_less_than_or_equal_to(100) }
  end
end
