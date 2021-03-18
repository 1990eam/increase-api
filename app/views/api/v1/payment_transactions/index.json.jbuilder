json.array! @transactions do |transaction|
  json.extract! transaction, :id, :payment_id, :transaction_identification, :amount, :status
end

