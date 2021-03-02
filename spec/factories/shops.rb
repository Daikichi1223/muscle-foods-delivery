FactoryBot.define do
  factory :shop do
    name                  {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {"1a" + Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    phone_number          {"00012345678"}
    postal_code           {Faker::Number.leading_zero_number(digits: 3) + "-" + Faker::Number.leading_zero_number(digits: 4)}
    area_id               {Faker::Number.between(from: 2, to: 48)}
    city                  {Gimei.address.city.to_s}
    address               {Gimei.address.town.to_s}
  end
end
