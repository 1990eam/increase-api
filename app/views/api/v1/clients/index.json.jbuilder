json.array! @clients do |client|
  json.extract! client, :id, :client_identification, :email, :first_name, :last_name, :job, :country, :address, :zip_code, :phone, :amount_to_be_paid, :date_to_be_paid, :amount_paid, :date_paid
end
