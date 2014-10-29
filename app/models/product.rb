class Product < ActiveRecord::Base
  scope :category, -> { where('category IS NOT NULL') }

  validates :name, presence: true
end
