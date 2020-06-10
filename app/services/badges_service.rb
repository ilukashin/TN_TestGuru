class BadgesService
  
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user

    @test_title = @test_passage.test.title
    @test_level =  @test_passage.test.level
    @test_category = @test_passage.test.category

    @success_rules = []
  end

  def run
    check_all_conditions

    Badge.assign_to_user(@success_rules)
  end

  private

  def check_all_conditions
    Badge::RULES.each { |rule| self.send("check_#{rule}", rule) }
  end

  def check_category(rule)
    all_tests = Test.where(category: @test_category).pluck(:title)
    user_tests = @user.tests.where(category: @test_category).pluck(:title).uniq

    @success_rules.push(rule) if user_tests.eql?(all_tests)
  end

  # in future probaly need to check 3, 5, 10... attempts
  def check_attempts(rule, count = 1)
    user_tests_attempts = @user.tests.where(title: @test_title).count

    @success_rules.push(rule) if user_tests_attempts.eql?(count)
  end

  def check_tests_level(rule)
    all_tests = Test.where(level: @test_level).pluck(:title)
    user_tests = @user.tests_by_level(@test_level).pluck(:title).uniq

    @success_rules.push(rule) if user_tests.eql?(all_tests)
  end
end
