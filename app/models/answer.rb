class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  validate :max_answers
  validate :min_answers

  private

  def max_answers
    errors.add(question, 'Answers limit reached!') if question.answers.count >= 4
  end

  def min_answers
    errors.add(question, 'Answers minimum reached!') if question.answers.count <= 1
  end
end
