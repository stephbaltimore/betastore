class Cart < ActiveRecord::Base
  has_many :cart_products

  def item_count
    cart_products.map(&:quantity).sum
  end

  def subtotal
    cart_products.map(&:price).sum
  end

end
