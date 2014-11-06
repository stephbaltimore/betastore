class Admin::ProductsController < ApplicationController

  before_action :require_login

  def require_login
    unless logged_in?
        redirect_to admin_login_path, alert: 'Please log in to continue'
    end
  end

  def index
    @products = Product.order('name').to_a
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  @product = Product.new
  end

  def create
  @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Product #{@product.name} was created"
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to admin_products_path, notice: "Product #{@product.name} was updated"
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to admin_products_path, notice: "Product #{@product.name} was deleted"
    else
      render 'deleted'
    end
  end


  private
  def product_params
    params.require(:product).permit(:name, :price, :image_url)
  end

  def logged_in?
    session[:user_id].present?
  end
end
