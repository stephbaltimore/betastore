class Cart < ActiveRecord::Base
  has_many :cart_products
  def item_count
    cart_products.map(&:quantity).sum

  end
end
