class Item < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum genre: { spring: 0, summer: 1,fall: 2,winter: 3, }

  enum weekday: { monday: 0, tuesday: 1,wednesday: 2,thursday: 3,friday: 4,saturday: 5,sunday: 6, }
  #byebug

  def like_by?(customer)
    likes.exists?(customer_id: customer.id)
  end
end
