class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :cart_products

  validates :name, presence: {message: 'is required'}
  validates :price, numericality: { greater_than_or_equal_to: 0, message: 'must be a number' }

  before_destroy :ensure_not_referenced_by_any_line_item

end
