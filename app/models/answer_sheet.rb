class AnswerSheet < ApplicationRecord
  belongs_to :text

  validates :description, presence: true
end
