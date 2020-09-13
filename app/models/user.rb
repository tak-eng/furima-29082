class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true
  validates :firstname_zen, presence: true
  validates :lastname_zen, presence: true
  validates :firstname_kana, presence: true
  validates :lastname_kana, presence: true
  validates :birthday, presence: true

end
