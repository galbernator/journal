FactoryGirl.define do
  factory :entry do
    association :user, factory: :user
  end
end
