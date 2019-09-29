FactoryBot.define do
  factory :item do
    name                              {"テスト"}
    price                             {300}
    description                       {"テストだよ！"}
    condition                         {1}
    task                              {1}
    payer_delivery_expense            {1}
    delivery_days                     {1}
    prefecture                        {"大阪府"}
    user_id                           {1}
    category_id                       {1}
    size_id                           {1}
  end
end
