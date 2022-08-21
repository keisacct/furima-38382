FactoryBot.define do
  factory :item do
    # image           { Faker::Lorem.sentence }
    title           { Faker::Commerce.product_name }
    description     { Faker::Lorem.sentence }
    price           { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id     { Faker::Number.between(from: 2, to: 11) }
    quality_id      { Faker::Number.between(from: 2, to: 7) }
    postage_id      { Faker::Number.between(from: 2, to: 3) }
    prefecture_id   { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }
    association :user
    
  end
end
