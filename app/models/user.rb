class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true
  validates :birthday, presence: true
  with_options presence: true do
    validates :firstname_zen, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :lastname_zen, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :lastname_kana, format: { with: /\A[ァ-ヶー－]+\z/}
  end

end
