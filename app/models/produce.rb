class Produce < ApplicationRecord
  belongs_to :farmer 
  
  validates :name, :quantity, :units, :unit_price, presence: true
  
end
