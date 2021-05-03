FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { 'テスト市' }
    address { 'テスト町１−１' }
    building_name { 'テストマンション101' }
    phone_number { '12345678901' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end