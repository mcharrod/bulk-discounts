merchant1 = Merchant.find_or_create_by!(name: "Hair Care")

discount1 = Discount.find_or_create_by!(merchant_id: merchant1.id, name: "20 off 10", percent: 20, min_quantity: 10)
discount2 = Discount.find_or_create_by!(merchant_id: merchant1.id, name: "30 off 15", percent: 30, min_quantity: 15)
discount3 = Discount.find_or_create_by!(merchant_id: merchant1.id, name: "15 off 15", percent: 15, min_quantity: 15)
