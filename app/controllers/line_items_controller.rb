class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def create
      product = Product.find(params[:product_id])
      @line_item = @cart.line_items.build(product: product)

      respond_to do |format|
        if @line_item.save
          format.html { redirect_to @line_item.cart,
            notice: 'Line item was successfully created.' }
          format.json { render :show,
            status: :created, location: @line_item }
        else
          format.html { render :new }
          format.json { render json: @line_item.errors,
            status: :unprocessable_entity }
        end
      end
  end
end
