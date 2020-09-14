FactoryBot.define do
  factory :item do
    id { 1 }
    name { 'yasai' }
    description { 'test' }
    category_id { 2 }
    price { 2000 }
    status_id { 2 }
    delivery_time_id { 2 }
    consignor_area_id { 2 }
    shipping_costs_burden_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
