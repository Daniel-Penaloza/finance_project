class IncomeSerializer
  include JSONAPI::Serializer
  
  attributes :id, :transmitter, :amount, :transmition_date
end
