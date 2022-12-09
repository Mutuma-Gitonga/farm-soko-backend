class SalePurchase < ApplicationRecord
  belongs_to :produce, foreign_key: :produce_id
  # OR SIMPLY:
  # belongs_to :produce
  belongs_to :consumer
end
