class Income < ApplicationRecord
  validates_presence_of :transmitter, :amount, :transmition_date
end
