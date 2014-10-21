class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order('name')
  end

  def show
    # @id = params[:id]
    @product = Product.find(params[:id])
  end

end
