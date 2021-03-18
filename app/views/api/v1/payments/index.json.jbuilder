json.array! @payments do |payment|
  json.extract! payment, :id, :client_id
end
