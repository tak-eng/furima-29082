FactoryBot.define do
  factory :sending_address do
    post_code {"123-4567"}
    shipping_address_id {"1"}
    city {"中央区"}
    house_number {"青山１−１−１"}
    building_name {"柳ビル１０１"}
    phone_number {"09012345678"}
    order {"1"}
  end
end
