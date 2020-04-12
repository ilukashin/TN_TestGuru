class TestsController < ApplicationController
  def show 
    get_question
    render 'show'
  end

  private

  def get_question
    @test = Test.find(params[:id])
  end
end
