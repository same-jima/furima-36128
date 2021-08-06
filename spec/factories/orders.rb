FactoryBot.define do
  factory :order do
    association :item_tag
  end
end
