FactoryGirl.define do
  factory :question do
    title 'Ponderous'
    body 'How much wood would a woodchuck chuck?'
    association :category, factory: :category
  end
end
