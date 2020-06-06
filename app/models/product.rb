class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_products, dependent: :destroy
	has_many :order_products

	attachment :image

  with_options presence: true do
    validates :genre_id
    validates :name
    validates :price
  end

  validates :is_valid, inclusion:{in: [true, false]}
end
