FactoryBot.define do
  factory :order_delivery do
    postal_code {'123-4567'}
    prefecture_id { 2 }
    city { '神奈川' }
    house_number{ '1-1' }
    phone_number{ 19015555555 }
    token { '1111111aaaaaa' }
  end
end
