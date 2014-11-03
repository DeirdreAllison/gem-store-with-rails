require 'test_helper'

class ListingCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    Product.create!(category: 'Fancy', name: 'Opal')
  end

  test 'list product categories in JSON' do
    get '/categories', {}, { 'Accept' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 1, json(response.body).size
  end
  # test 'list product categories in XML' do
  #   get '/categories', {}, { 'Accept' => 'application/xml'}

  #   assert_equal 200, response.status
  #   assert_equal Mime::XML, response.content_type

  #   assert_equal 1, Hash.from_xml(response.body['books']).size
  # end
end
