class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy start]

  def show; end

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(post_params)
    @test.author_id = current_user.id
    
    byebug
    if @test.save
      redirect_to tests_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @test.update(post_params)
      redirect_to tests_path
    else
      render 'edit'
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
    
  private

  def find_test
    @test = Test.find(params[:id])
  end

  def post_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
