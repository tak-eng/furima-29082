FactoryBot.define do
  factory :item do
    name {Faker::App.name}
    text {Faker::Company.name}
    price {Faker::Number.number(digits: 6)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
