require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest

def test_create_product
  visit "/admin/products"
  click_on "New Product"
  fill_in "Name", with: 'Test Product'
  fill_in "Price", with: '1.00'
  fill_in "Image url", with: 'https://www.google.com/images/srpr/logo11w.png'
  click_on "Create Product"
  assert page.has_content?('Product Test Product was created')
  click_on "Test Product"
  click_on "Edit"
  fill_in "Price", with: '123.45'
  click_on "Update Product"
  assert page.has_content?('Product Test Product was updated')
  assert page.has_content?('123.45')
  click_on "Test Product"
  click_on "Edit"
  click_on "Delete"
  assert page.has_content?('Product Test Product was deleted')
end

end
