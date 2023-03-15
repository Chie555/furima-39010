FactoryBot.define do
  factory :order_payment do
    token           { 'tok_abcdefghijk00000000000000000' }
    post_code       { '000-0000' }
    prefecture_id   { Faker::Number.between(from: 2, to: 48) }
    municipalities  { Faker::Address.city }
    address         { Faker::Address.street_address }
    building        { Faker::Address.street_address }
    phone_number    { '0000000000' }
    user_id { Faker::Number.between(from: 1) }
    item_id { Faker::Number.between(from: 1) }
  end
end
