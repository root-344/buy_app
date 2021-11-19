class Like < ApplicationRecord
  belongs_to :store
  belongs_to :item

  validates_uniqueness_of :item_id, scope: :store_id
end
