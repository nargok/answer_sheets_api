class AnswerSheet < ApplicationRecord
  belongs_to :text
  has_many :answers

  validates :description, presence: true
end
