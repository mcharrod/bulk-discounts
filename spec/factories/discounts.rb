FactoryBot.define do
  factory :discount do
    merchant
    min_quantity { 3 }
    percent { 10 }
    name { "#{Faker::Commerce.product_name} discount" }
  end
end
