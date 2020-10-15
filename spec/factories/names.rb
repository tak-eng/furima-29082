FactoryBot.define do
  factory :name do
    firstname_zen {Gimei.first.kanji}
    lastname_zen {Gimei.last.kanji}
    firstname_kana {Gimei.first.katakana}
    lastname_kana {Gimei.last.katakana}
    birthday {Faker::Date.birthday}
  end
end
