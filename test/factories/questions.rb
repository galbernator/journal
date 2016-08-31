FactoryGirl.define do
  factory :question do
    text 'How much wood would a woodchuck chuck?'
    association :category, factory: :category
  end
end
