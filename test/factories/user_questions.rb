FactoryGirl.define do
  factory :user_question do
    association :user, factory: :user
    association :question, factory: :question
  end
end
