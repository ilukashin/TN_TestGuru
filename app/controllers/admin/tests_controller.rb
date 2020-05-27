class Admin::TestsController < Admin::BaseController

  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy update_inline]

  def show; end

  def index; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author_id = current_user.id

    if @test.save
      redirect_to admin_tests_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end
    
  private

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    test_pars = params.require(:test).permit(:title, :level, :category_id, :duration)

    test_pars[:duration] = prepare_duration(test_pars[:duration]) if test_pars[:duration].present?
    test_pars
  end

  def prepare_duration(duration)
    duration.to_time.seconds_since_midnight
  end
end
