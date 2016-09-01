class Question < ApplicationRecord

  belongs_to :category

  validates :text, :category_id, presence: true
  validates :text, length: { maximum: 160 }

end
