class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validatation_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    
    save!
  end

  def success?
    percent_correct >= 85
  end

  def percent_correct
    correct_questions.to_f / test.questions.count * 100
  end

  def current_question_number
    test_questions.where('id <= ?', current_question.id).count
  end

  private 

  def before_validatation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test_questions.first
    else
      test_questions.where('id > ?', current_question.id).first
    end
  end

  def test_questions
    test.questions.order(:id)
  end

end
