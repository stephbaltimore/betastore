class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    order = Order.create!(order_params)

    begin
      charge = Stripe::Charge.create(
      :amount => (current_cart.total * 100).round, # amount in cents, again
      :currency => "usd",
      :card => params[:stripeToken],
      :description => order.email
      )
    end

    current_cart.cart_products.each do |cart_product|
      line_item = order.line_items.build(
      product_id:  cart_product.product_id,
      name:        cart_product.product.name,
      price:       cart_product.product.price,
      quantity:    cart_product.quantity,
      )
      line_item.save!
    end

    session[:cart_id] = nil

    redirect_to order, notice: "Order Created"
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:email).merge(cart_id: current_cart.id)
  end

end
