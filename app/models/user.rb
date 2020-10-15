class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments
  has_many :items
  has_many :pays
  has_one :name
  
  
  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }



end
