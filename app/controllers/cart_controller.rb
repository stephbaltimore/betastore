class CartController < ApplicationController
  def show;
  end

  def create
  end

  def show
    @cart = Cart.find_by(params[:id])
  end

  def item_count
    cart_products.map(&:quantity).sum
  end

  def subtotal
    cart_products.map(&:price).sum
  end

  def total
    #TODO: sales tax
    subtotal
  end
end
