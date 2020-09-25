class SendingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_address

  belongs_to :order

  with_options presence: true  do
    validates :post_code, inclusion: { in: "-" }
    validates :shipping_cost_id
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }
    validates :order
  end
end
