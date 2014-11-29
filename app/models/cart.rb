class Cart < ActiveRecord::Base
  has_many :cart_products
  has_many :line_items, dependent: :destroy

  def item_count
    cart_products.map(&:quantity).sum
  end

  def subtotal
    cart_products.map(&:price).sum
  end

end
