class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { minimum: 10 }
  validates :body, presence: true
  validates :body, length: { minimum: 10 }

  validates :user, presence: true
end
