class CartController < ApplicationController
  def show;
  end

  def create
  end

  def show
    @cart = Cart.find_by(params[:id])
  end

end
