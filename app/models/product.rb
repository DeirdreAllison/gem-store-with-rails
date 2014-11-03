class Product < ActiveRecord::Base
  belongs_to :category
  scope :category, -> { where('category IS NOT NULL') }

  validates :name, presence: true
end
