class Order < ApplicationRecord
  belongs_to :store
  belongs_to :item
  has_one :address
end
