class SalePurchase < ApplicationRecord
  belongs_to :consumer

  belongs_to :produce, foreign_key: :produce_id
  # OR SIMPLY:
  # belongs_to :produce
  # belongs_to :farmer, through: :produce
end
