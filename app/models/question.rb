class Question < ActiveRecord::Base
  validates :title, presence: true
  validates :title, length: { minimum: 40 }
  validates :body, presence: true
  validates :body, length: { minimum: 150 }
end
