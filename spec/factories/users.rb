FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"山たタ"}
    first_name            {"太ろウ"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_day             {"2020-01-01"}
  end
end