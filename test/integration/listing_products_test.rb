require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  setup do
    Product.create!(name: 'Azurite',
    description: 'Some gems have hidden qualities beyond their luster, beyond their shine... Azurite is one of those gems.',
    shine: 8,
    price: 110.50,
    rarity: 7,
    color: '#CCC',
    faces: 14,
    images: 'images/gem-02.gif')
  end

  test 'listing products' do
  get '/products'

  assert_equal 200, response.status
  assert_equal Mime::JSON, response.content_type

  assert_equal Product.count, JSON.parse(response.body).size

  end
end
