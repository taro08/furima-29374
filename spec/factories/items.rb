FactoryBot.define do
  factory :item do
    id {1}
    name { "yasai" }
    description { "test" }
    category { 2 }
    price { 2000 }
    status { 2 }
    delivery_time { 2 }
    consignor_area { 2 }
    shipping_costs_burden { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  
  end
end
