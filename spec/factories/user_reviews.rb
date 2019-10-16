FactoryBot.define do
  factory :user_review do
    score {[:good, :normal, :bad].sample}
    comment {Faker::Games::Pokemon.move}
    user
    trade
  end
end