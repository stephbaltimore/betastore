class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order('name')
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
    params.require(:product).permit!
  end

end
