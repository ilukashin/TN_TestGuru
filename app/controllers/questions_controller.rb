class QuestionsController < ApplicationController
  before_action :get_test

  def show 
    get_question
    if @question
      render html: "<h3>#{@question.body}</h3>".html_safe
    else
      render plain: @message
    end
  end

  def new
    get_test
    @question = Question.new
  end

  def create
    get_test
    @question = @test.questions.new(post_params)
    if @question.save
      redirect_to @test
    else
      render 'new'
    end
  end

  def destroy
    get_question
    @question.destroy
    redirect_to @test
  end

  private

  def get_test
    @test = Test.find(params[:test_id])
  end
  
  def get_question
    @question = @test.questions.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    @message = "Test '#{@test.title}' has no question with id: #{params[:id]}"
  end

  def post_params
    params.require(:question).permit(:body)
  end
end
