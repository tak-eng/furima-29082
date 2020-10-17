FactoryBot.define do
  factory :item do
    name {Faker::App.name}
    text {Faker::Company.name}
    price {Faker::Number.number(digits: 6)}
    user
    category_id {"1"}
    item_condition_id {"1"}
    shipping_cost_id {"1"}
    shipping_address_id {"1"}
    delivery_date_id {"1"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
