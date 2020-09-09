FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '鈴木' }
    first_name { '太郎' }
    last_name_reading { 'スズキ' }
    first_name_reading { 'タロウ' }
    birth_day { Date.today }
  end
end
