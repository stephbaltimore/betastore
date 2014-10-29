class Customer < ActiveRecord::Base

  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items

  validates :name, presence: true, length:{ maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: true
end
