class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :item_condition, :shipping_costs, :shipping_address, :derivery_date
  has_one_attached :image
  belongs_to :user 
  has_many :comments 
  has_one :pay


  validates :name, presence: true
  validates :text, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, messages:"半角数字のみを使ってください"}
  validates :user, presence: true, foreign_key: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :shipping_costs_id, presence: true
  validates :shipping_address_id, presence: true
  validates :derivery_date_id, presence: true

  #空の投稿を保存できないようにする
  validates :title, :text, :category, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :item_condition_id, :shipping_costs_id, :shipping_address_id, :derivery_date_id, numericality: { other_than: 1 } 
end
