class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :states
  belongs_to :shipping_fee
  belongs_to :region
  belongs_to :eta
  belongs_to :farm

  # 後で使用
  # has_one :order
  # has_one_attached :image

  with_options presence: true do
    validates :product
    validates :description
    validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :states_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :region_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :eta_id, numericality: { other_than: 1, message: 'を選択してください' }, format: { with: /\A[0-9]+\z/ }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true,
                                                                      greater_than: 9, less_than: 10_000_000 }
    # 後で使用する
    # validates :image
  end
end
