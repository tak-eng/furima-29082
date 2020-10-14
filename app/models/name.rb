class Name < ApplicationRecord
  belongs_to :user, optional: true
  validates :firstname_zen, :lastname_zen, :firstname_kana, :lastname_kana, :birthday ,presence: true
end
