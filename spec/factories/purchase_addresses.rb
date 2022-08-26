FactoryBot.define do
  factory :purchase_address do
    zipcode            { '123-4567'}
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    city               { '東京都' }
    street             { '1-2-3 杉並区' }
    building           { 'シャーメゾン' }
    phone_number       { '09012345678' }
    token              { 'tok_8bf2c2d0f21bec2f460e4576b42c7' }
    user_id            { '1' }
    item_id            { '1' }
  end
end
