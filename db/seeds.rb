merchant1 = Merchant.find_or_create_by!(name: "Office Supplies")

item1 = Item.find_or_create_by!(merchant_id: merchant1.id, name: "Stapler", description: "Staples", unit_price: 10)
item2 = Item.find_or_create_by!(merchant_id: merchant1.id, name: "Paper", description: "Needs staples", unit_price: 5)
item3 = Item.find_or_create_by!(merchant_id: merchant1.id, name: "Paperclip", description: "Less permament staple", unit_price: 100)

discount1 = Discount.find_or_create_by!(merchant_id: merchant1.id, name: "20 off 10", percent: 20, min_quantity: 10)
discount2 = Discount.find_or_create_by!(merchant_id: merchant1.id, name: "30 off 15", percent: 30, min_quantity: 15)
discount3 = Discount.find_or_create_by!(merchant_id: merchant1.id, name: "15 off 15", percent: 15, min_quantity: 15)

customer1 = Customer.find_or_create_by!(first_name: "Charles", last_name: "Hook")
customer2 = Customer.find_or_create_by!(first_name: "Carol", last_name: "Baskins")
customer3 = Customer.find_or_create_by!(first_name: "Marilyn", last_name: "Manson")

invoice1 = Invoice.find_or_create_by!(customer_id: customer1.id, status: 0)
invoice2 = Invoice.find_or_create_by!(customer_id: customer1.id, status: 0)

invoice3 = Invoice.find_or_create_by!(customer_id: customer2.id, status: 0)
invoice4 = Invoice.find_or_create_by!(customer_id: customer2.id, status: 0)

invoice_item1 = InvoiceItem.find_or_create_by!(invoice_id: invoice1.id, item_id: item1.id, quantity: 3, unit_price: 5, status: 0)
invoice_item1 = InvoiceItem.find_or_create_by!(invoice_id: invoice1.id, item_id: item1.id, quantity: 10, unit_price: 50, status: 0)
invoice_item1 = InvoiceItem.find_or_create_by!(invoice_id: invoice1.id, item_id: item1.id, quantity: 4, unit_price: 9, status: 0)
invoice_item1 = InvoiceItem.find_or_create_by!(invoice_id: invoice1.id, item_id: item1.id, quantity: 3, unit_price: 3, status: 0)
