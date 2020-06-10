class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      @test_passage.badges_action
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show    
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      gist_link = result.gist_link
      create_gist_object(@test_passage.current_question, gist_link)
      flash[:notice] = "Successfully created gist! Check this #{view_context.link_to 'link', gist_link, target: '_blank'}."
    else
      flash[:alert] = 'Failed to create gist.'
    end

    redirect_to @test_passage
  end

  private

  def create_gist_object(question, gist_link)
    Gist.create!(title: question.body,
                 url: gist_link,
                 user_id: current_user.id,
                 question_id: question.id)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
