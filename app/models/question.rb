class Question < ActiveRecord::Base
  has_many :answers

  validates :title, presence: true
  validates :title, length: { minimum: 10 }
  validates :body, presence: true
  validates :body, length: { minimum: 10 }
end
