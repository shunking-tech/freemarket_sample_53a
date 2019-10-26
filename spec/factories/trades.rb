FactoryBot.define do
  factory :trade do
    association :seller, factory: :user
    association :buyer, factory: :user
    item
    status {1}
  end
end
