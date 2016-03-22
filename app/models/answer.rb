class Answer < ActiveRecord::Base
  belongs_to :question

  validates :body, presence: true
  validates :body, length: { minimum: 50}
  validates :question, presence: true
end
