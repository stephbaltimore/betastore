class ProductsController < ApplicationController
  def index
    @products = Product.order('name').all
  end

  def add_to_cart
    # cart = Cart.find_or_create_by(id: session[:cart_id])
    # session[:cart_id] = cart.id

    if session[:cart_id].blank?
      cart = Cart.create
      session[:cart_id] = cart.id
    else
      cart = Cart.find(session[:cart_id])
    end

    product = Product.find(params[:id])
    cart_item = cart.cart_products.build(product: product)
    if cart_item.save
      redirect_to products_path, notice: 'Added item to cart'
    else
      redirect_to products_path, notice: 'Oops that didnt work'
    end
  end
end
