class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :shine, :price, :rarity,
             :color, :faces, :images, :category_id
end

