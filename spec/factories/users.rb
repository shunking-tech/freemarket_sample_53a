FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    sequence(:email)      {Faker::Internet.email}
    first_name            {"名"}
    first_name_kana       {"メイ"}
    last_name             {"姓"}
    last_name_kana        {"セイ"}
    birth_date            {"1994/10/15"}
    password              {"0000aaaa"}
    password_confirmation {"0000aaaa"}
  end
end
