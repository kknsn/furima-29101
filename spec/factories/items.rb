FactoryBot.define do
  factory :item do
    id                 {1}
    name               {"商品名"}
    description        {"説明"}
    category_id        {2}
    state_id           {2}
    delivery_fee_id    {2}
    area_id            {2}
    day_id             {2}
    price              {1000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
