FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'a1a1s2s2' }
    password_confirmation { 'a1a1s2s2' }
    last_name { '仮野' }
    first_name { '名前' }
    last_name_kana { 'カリノ' }
    first_name_kana { 'ナマエ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
