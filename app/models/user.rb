class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :comments
  has_many :items
  has_many :pays
  
  
  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, messages:"全角の漢字・ひらがな・カタカナのいづれかを使ってください"} do
    validates :firstname_zen
    validates :lastname_zen
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/,  messages:"全角カタカナを使ってください"} do
    validates :firstname_kana
    validates :lastname_kana    
  end


end
