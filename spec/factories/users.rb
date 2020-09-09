FactoryBot.define do
  factory :user do
    nickname              {"ai"}
    email                 {"kkk@gmail.com"}
    password              {"aaa000"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"2020/10/10"}
  end
end