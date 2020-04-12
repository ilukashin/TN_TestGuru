class TestsController < ApplicationController
  before_action :find_question

  def show 
    render 'show'
  end

  private

  def find_question
    @test = Test.find(params[:id])
  end
end
