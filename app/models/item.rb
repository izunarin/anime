class Item < ApplicationRecord
  
  enum genre: { payment_waiting: 0, payment_confirmation: 1,in_production: 2,preparing_delivery: 3,delivered: 4, }
end
