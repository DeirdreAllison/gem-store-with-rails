require 'test_helper'

class CreatingProductsTest < ActionDispatch::IntegrationTest
  test 'created books with valid data' do
    post '/products', { product: {
      name: 'Azurite',
      description: 'Some gems have hidden qualities beyond their luster, beyond their shine... Azurite is one of those gems.',
      shine: 8,
      price: 110.50,
      rarity: 7,
      color: '#CCC',
      faces: 14,
      images: 'images/gem-02.gif'
      } }.to_json,
      { 'Accept' => 'application/json',
        'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    product = json(response.body)
    assert_equal product_url(product[:id]), response.location

    assert_equal 'Azurite', product[:name]
    assert_equal 7, product[:rarity].to_i
    assert_equal 'Some gems have hidden qualities beyond their luster, beyond their shine... Azurite is one of those gems.', product[:description]
    assert_equal 8, product[:shine]
    assert_equal '110.5', product[:price]
    assert_equal '#CCC', product[:color]
    assert_equal 14, product[:faces]
    assert_equal 'images/gem-02.gif', product[:images]
  end

  test 'does not create books with valid data' do
    post '#/products', { product: {
      name: nil,
      rarity: 7
      } }.to_json,
      { 'Accept' => 'application/json',
        'Content-Type' => 'application/json'}
    assert_equal 422, response.status
  end
end
