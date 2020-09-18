class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_address
  belongs_to_active_hash :derivery_date
  has_one_attached :image
  belongs_to :user 
  has_many :comments 
  has_one :pay

  with_options presence: true  do
    validates :name
    validates :text
    validates :user
    validates :category_id
    validates :item_condition_id
    validates :shipping_costs_id
    validates :shipping_address_id
    validates :derivery_date_id
  end
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, messages:"半角数字のみを使ってください"}

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :item_condition_id, :shipping_costs_id, :shipping_address_id, :derivery_date_id, numericality: { other_than: 1 } 
end