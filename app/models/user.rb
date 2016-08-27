class User < ApplicationRecord
  has_secure_password

  has_many :entries

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true,
    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :password, confirmation: true

  def name
    [first_name, last_name].join(' ')
  end

end
