FactoryGirl.define do

  factory :category do
    sequence(:name) { |i| "カテゴリ#{i}" }
  end
end
