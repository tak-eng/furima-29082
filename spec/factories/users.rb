FactoryBot.define do
  factory :user do
    nickname {Gimei.unique.name}
    email {Faker::Internet.email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    firstname_zen {Gimei.first.kanji}
    lastname_zen {Gimei.last.kanji}
    firstname_kana {Gimei.first.katakana}
    lastname_kana {Gimei.last.katakana}
    birthday {Faker::Date.birthday}
  end
end
