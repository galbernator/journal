class Question < ApplicationRecord

  belongs_to :category
  has_many :user_questions, dependent: :destroy
  has_many :users, through: :user_questions

  validates :text, :category_id, presence: true
  validates :text, length: { maximum: 160 }

end
