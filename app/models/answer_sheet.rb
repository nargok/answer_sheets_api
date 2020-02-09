class AnswerSheet < ApplicationRecord
  belongs_to :text
  has_many :answers

  validates :description, presence: true
  # TODO 途中保存、提出のステータスを管理するフラグを追加する
end
