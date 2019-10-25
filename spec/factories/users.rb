FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8, max_length: 20, mix_case: true)

    sequence(:nickname)              {Faker::Internet.username(specifier: 3..10)}
    sequence(:email)                 {Faker::Internet.email}
    sequence(:first_name)            {Faker::Name.first_name}
    first_name_kana                  {"メイ"}
    sequence(:last_name)             {Faker::Name.last_name}
    last_name_kana                   {"セイ"}
    sequence(:birth_date)            {(Faker::Number.within(range: Time.current.year-100..Time.current.year)).to_s + "/" + (Faker::Number.within(range: 1..12)).to_s + "/" + (Faker::Number.within(range: 1..20)).to_s}
    password                         {|n| password+(n.to_s)}
    password_confirmation            {|n| password+(n.to_s)}
  end
end
