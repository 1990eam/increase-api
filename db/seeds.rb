puts "Deleting all records"
Header.destroy_all
PaymentTransaction.destroy_all
Discount.destroy_all
Footer.destroy_all
Payment.destroy_all
Client.destroy_all

# puts "Creating Client"

# client = Client.new(
#   email: "magni.elian@gmail.com",
#   first_name: "Elian",
#   last_name: "Magni",
#   job: "Developer",
#   country: "Argentina",
#   address: "Ballester 4200",
#   zip_code: "1653",
#   phone: "1566008521",
#   )
# client.save

# puts "Creating Payment"

# payment = Payment.new
# payment.client = client
# payment.save

# puts "Creating Header"

# header = Header.new(
#  payment: payment,
#  registry_type: 1,
#  payment_identification: nil,
#  currency: 000,
#  total_amount: 1000000,
#  total_discounts: 50000,
#  total_amount_with_discounts: 950000,
# )
# header.save

# puts "Creating Transaction"

# transaction = PaymentTransaction.new(
#   payment: payment,
#   registry_type: 2,
#   amount: 1000000,
#   status: 1,
#   )
# transaction.save

# puts "Creating Discount"

# discount = Discount.new(
#   payment: payment,
#   registry_type: 3,
#   amount: 50000,
#   discount_type: 1
#   )
# discount.save

# puts "Creating Footer"
# footer = Footer.new(
#   payment: payment,
#   registry_type: 4,
#   payment_date: Date.tomorrow,
#   client_identification: nil
#   )
# footer.save
