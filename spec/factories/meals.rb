FactoryBot.define do
  factory :meal do
    image                 {Faker::Lorem.sentence}
    name                  {Faker::Lorem.characters(number: 10)}
    explanation           {Faker::Lorem.sentence}
    genre_id              {Faker::Number.between(from: 2, to: 12)}
    protein               {Faker::Number.number(digits: 2)}
    fat                   {Faker::Number.number(digits: 2)}
    carbo                 {Faker::Number.number(digits: 2)}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
    association :shop

    after(:build) do |meal|
      meal.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end