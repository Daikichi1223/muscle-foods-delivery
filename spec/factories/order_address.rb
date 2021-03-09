FactoryBot.define do
  factory :order_address do
    token              {"tok_abcdefghijk00000000000000000"}
    postal_code        {Faker::Number.leading_zero_number(digits: 3) + "-" + Faker::Number.leading_zero_number(digits: 4)}
    area_id            {Faker::Number.between(from: 2, to: 48)}
    city               {Gimei.address.city.to_s}
    address            {Gimei.address.town.to_s}
    building_name      {"柳ビル103"}
    phone_number       {"09012345678"}
  end
end