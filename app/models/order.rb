class Order < ActiveRecord::Base

  belongs_to :customer
  has_many :line_items, dependent: :destroy
  has_many :products, :through => :line_items

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  def calculate_order_total_amount
    self.total_amount = 0
    for line_item in line_items
      self.total_amount += line_item.total_amount
    end
    save
  end

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
