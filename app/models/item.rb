class Item < ApplicationRecord
  
  enum genre: { spring: 0, summer: 1,fall: 2,winter: 3, }
  
  enum weekday: { monday: 0, tuesday: 1,wednesday: 2,thursday: 3,friday: 4,saturday: 5,sunday: 6, }
end
