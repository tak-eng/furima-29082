class OrderAddress
  include ActiveModel::Model
  attr_accessor :shipping_address_id, :item_id, :post_code, :city, :house_number, :building_name, :phone_number, :user_id, :order_id, :price, :token

  with_options presence: true  do
    validates :user
    validates :item
    validates :post_code, inclusion: { in: "-" }
    validates :shipping_cost_id
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    SendingAddress.create!(post_code: post_code, shipping_address_id: shipping_address_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end