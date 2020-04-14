class TestsController < ApplicationController
  before_action :find_question, only: %i[show]

  def show 
    render 'show'
  end

  def index
    @tests = Test.all
  end
    
  private

  def find_question
    @test = Test.find(params[:id])
  end
end
