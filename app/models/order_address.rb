class OrderAddress
  include ActiveModel::Model
  attr_accessor :store_id, :item_id, :zip, :region_id, :city, :house_number, :building_number, :phone, :token

  with_options presence: true do
    validates :store_id
    validates :item_id
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にはハイフンを入れてください' }
    validates :city
    validates :house_number
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'は半角数字10~11桁で入力してください' }
    validates :token
  end
  validates :region_id, numericality: { other_than: 1, message: 'を選んで下さい' }

  def save
    order = Order.create(store_id: store_id, item_id: item_id)
    Address.create(zip: zip, region_id: region_id, city: city, house_number: house_number,
                   building_number: building_number, phone: phone, order_id: order.id)
  end
end
