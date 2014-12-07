
class LineItem < ActiveRecord::Base
  belongs_to :order
  has_one :product

  after_save :calculate_order_total_amount

  def calculate_order_total_amount
    order.calculate_order_total_amount
  end

  def total_amount
    quantity * product.price
  end

end
