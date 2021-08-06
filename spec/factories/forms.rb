FactoryBot.define do
  factory :form do
    token           { "tok_abcdefghijk00000000000000000" }
    postal_code     { "100-0004" }
    area_id         { 14 }
    municipality    { "千代田区" }
    address         { "大手町" }
    building        { "千代田マンション201" }
    phone_num       { "08053301001" }
  end
end
