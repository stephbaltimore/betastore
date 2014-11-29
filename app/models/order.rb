class Order < ActiveRecord::Base

  belongs_to :customer
  has_many :line_items
  has_many :products, :through => :line_items


  def calculate_order_total_amount
    self.total_amount = 0
    for line_item in line_items
      self.total_amount += line_item.total_amount
    end
    save
  end

end
