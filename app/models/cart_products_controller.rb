class CartProductsController < ApplicationController

  def destroy
    cart_product = current_cart.cart_products.find {|cp| cp.id == params[:id].try(:to_i) }

    if cart_product.present?
      cart_product.destroy!
      redirect_to cart_path
    else
      raise ActiveRecord::RecordNotFound
    end
  end

end
