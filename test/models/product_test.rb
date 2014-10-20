require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "create a product" do
    product = Product.new(name: 'test', price: 0.99)
    assert product.save, product.errors.full_messages
  end

  test "name is required" do
    product = Product.new
    refute product.save, 'name should be required'
    assert product.errors.full_messages.include?("Name is required")
      product.errors.full_messages
  end

  test "price is present" do
    product = Product.new(price: 'fail')
    refute product.save, 'price should be a number'
    assert product.errors.full_messages.include?("Price must be a number")
      product.errors.full_messages
  end

end
