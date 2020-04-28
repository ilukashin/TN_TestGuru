module QuestionsHelper
  def question_header(question)
    t('.header', test_name: question.test.title)
  end
end
