class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :item_condition, :shipping_costs, :shipping_address, :derivery_date
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :title, :text, :category, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :item_condition_id, :shipping_costs_id, :shipping_address_id, :derivery_date_id, numericality: { other_than: 1 } 
end
