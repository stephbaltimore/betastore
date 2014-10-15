require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "create a product" do
    product = Product.new
    refute product.save, product.errors.full_messages
  end

  test "name is required" do
    product = Product.new
    refute product.save, 'name should be required'
    assert product.errors.full_messages.include?("Name can't be blank")
  end

  test "price is present" do
    product = Product.new
    refute product.save, 'price should be required'
    assert product.errors.full_messages.include?("Price is not a number")
  end

end
