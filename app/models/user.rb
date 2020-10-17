class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  has_many :comments
  has_many :items
  has_many :pays
  has_one :name
  has_many :sns_credentials
  
  
  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }



end
