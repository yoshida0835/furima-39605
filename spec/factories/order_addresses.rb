FactoryBot.define do
  factory :order_address do
    post_code      { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    prefecture_id  { Faker::Number.between(from: 2, to: 47) }
    city           { Faker::Address.city }
    street         { Faker::Address.street_address }
    building       { Faker::Address.building_number }
    tel_number     { "0" + Faker::Number.between(from: 1000000000, to: 9999999999).to_s }
  end
end
