FactoryBot.define do
  factory :item do
    name { Faker::Game.platform }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipment_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |i|
      i.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end

    association :user
  end
end
