FactoryBot.define do
  factory :item do
    image            {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/test.jpg')) }
    name             { Faker::Name.initials(number: 4) }
    detail           { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    status_id        { Faker::Number.between(from: 2, to: 7) }
    delivery_cost_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id    { Faker::Number.between(from: 2, to: 47) }
    delivery_day_id  { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end