FactoryBot.define do
  factory :item do
    title           { Faker::Name.name }
    description     { Faker::Lorem.paragraph }
    category_id     { Faker::Number.between(from: 2, to: 11) }
    condition_id    { Faker::Number.between(from: 2, to: 7) }
    ship_fee_id     { Faker::Number.between(from: 2, to: 3) }
    prefecture_id   { Faker::Number.between(from: 2, to: 48) }
    ship_date_id    { Faker::Number.between(from: 2, to: 4) }
    price           { Faker::Number.between(from: 300, to: 9999999) }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
