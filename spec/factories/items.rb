FactoryBot.define do
  factory :item do
    sequence(:name)                   {Faker::Book.title}
    sequence(:price)                  {Faker::Number.within(range: 300..999999)}
    sequence(:description)            {Faker::Lorem.sentence}
    condition                         {1}
    task                              {1}
    payer_delivery_expense            {1}
    shipping_method                   {1}
    delivery_days                     {1}
    prefecture_id                     {Faker::Number.within(range: 1..47)}
    user
    category
    size
  end
end
