require 'test_helper'

class CreatingProductsTest < ActionDispatch::IntegrationTest
  test 'created books with valid data' do
    post '/products', { product: {
      name: 'Azurite',
      rarity: 7
      } }.to_json,
      { 'Accept' => 'application/json',
        'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    product = json(response.body)
    assert_equal product_url(product[:id]), response.location

    assert_equal 'Azurite', product[:name]
    assert_equal 7, product[:rarity].to_i
  end

  test 'does not create books with valid data' do
    post '/products', { product: {
      name: nil,
      rarity: 7
      } }.to_json,
      { 'Accept' => 'application/json',
        'Content-Type' => 'application/json'}
    assert_equal 422, response.status
  end
end
