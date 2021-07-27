FactoryBot.define do
  factory :user do
    
    name                  { "山田太朗" }
    email                 { Faker::Internet.free_email }
    password              { "test123" }
    password_confirmation {password}
    birthday              { "2000-01-01" }
    last_name             { "山田" }
    first_name            { "太朗" }
    last_name_kana        { "ヤマダ" }
    first_name_kana       { "タロウ" }
  end
end