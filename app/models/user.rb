class User < ActiveRecord::Base
  has_secure_password
  has_many :questions

  validates :name, presence: true

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }

end
