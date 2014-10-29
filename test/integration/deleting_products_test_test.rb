require 'test_helper'

class DeletingProductsTestTest < ActionDispatch::IntegrationTest
  setup do
    @product = Product.create!(name: 'Azurite')
  end
  test 'delete products' do
    delete "/products/#{@product.id}"

    assert_equal 204, response.status
  end
end
