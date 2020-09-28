class OrderAddress
  include ActiveModel::Model
  attr_accessor :shipping_address_id, :item_id, :post_code, :city, :house_number, :building_name, :phone_number, :user_id, :order_id, :price, :token

  with_options presence: true  do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code,  format: { with: /\A\d{3}[-]\d{4}\z/,  messages:"ハイフンを入れてください"}
    validates :shipping_address_id
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }
    validates :phone_number, format: { with: /\A\d{10,11}\z/,  messages:"ハイフンを入れないでください"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    SendingAddress.create!(post_code: post_code, shipping_address_id: shipping_address_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end