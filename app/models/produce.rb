class Produce < ApplicationRecord

  validates :name, :quantity, :units, :unit_price, presence: true

  belongs_to :farmer 
  # has_one :sale_purchase, foreign_key: :produce_id
  has_one :sale_purchase
  # belongs_to :consumer, through: :sale_purchase
  
  # OR SIMPLY:
  # has_one :sale_purchase
  
end
