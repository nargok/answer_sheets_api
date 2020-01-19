class Text < ApplicationRecord
  has_many :answer_sheets
  validates :title, presence: true
end
