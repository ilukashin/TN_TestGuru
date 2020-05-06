class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show    
    end
  end

  def gist
    work = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if work.success?
      gist_link = work.gist_link
      Gist.create!(question: @test_passage.current_question.body,
                   url: gist_link,
                   user_email: current_user.email)
      { notice: "Successfully created gist! Check this #{view_context.link_to 'link', gist_link, target: '_blank'}." }
    else
      { alert: 'Failed to create gist.' }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
