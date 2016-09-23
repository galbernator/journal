class User < ApplicationRecord
  has_secure_password

  has_many :entries
  has_many :user_questions, dependent: :destroy
  has_many :questions, through: :user_questions

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true,
    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :password, presence: :true, confirmation: true, on: :create

  def name
    [first_name, last_name].join(' ')
  end

end
