class Produce < ApplicationRecord

  validates :name, :quantity, :units, :unit_price, presence: true

  belongs_to :farmer 
  has_one :sale_purchase, foreign_key: :produce_id
  # OR SIMPLY:
  # has_one :sale_purchase
  
end
