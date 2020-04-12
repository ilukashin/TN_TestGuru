class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def show 
    render html: "<h3>#{@question.body}</h3>".html_safe
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(post_params)
    if @question.save
      redirect_to @test
    else
      render 'new'
    end
  end

  def destroy
    @test = @question.test
    @question.destroy
    redirect_to @test
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end
  
  def find_question
    @question = Question.find(params[:id])
  end

  def question_not_found
    render plain: "no question with id: #{params[:id]}"
  end

  def post_params
    params.require(:question).permit(:body)
  end
end
