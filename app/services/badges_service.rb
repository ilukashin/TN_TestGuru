class BadgesService
  
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user

    @test_title = @test_passage.test.title
    @test_level =  @test_passage.test.level
    @test_category = @test_passage.test.category.title

    @badges_ids = []
    @checked = false
  end

  # completed work with badges - check and reward user
  def run
    check_all_conditions unless @checked
    assign_badges_to_user(@badges_ids)
    @badges_ids
  end

  # only for getting list of badges ids
  def check_all_conditions
    Badge::RULES.each { |rule| self.send("check_#{rule}", rule) }
    @checked = true
    @badges_ids
  end

  private

  def check_test_category(rule)
    all_tests = Category.where(title: @test_category).first&.tests.pluck(:id).sort
    user_tests = @user.tests.where(category: @test_category).pluck(:id).uniq.sort

    @badges_ids.push(Badge.where(rule: rule, value: @test_category).first&.id) if user_tests.eql?(all_tests)
  end

  def check_attempts(rule)
    user_tests_attempts = @user.tests.where(title: @test_title).count

    badge_id = Badge.where(rule: rule, value: user_tests_attempts).first&.id

    @badges_ids.push(badge_id) if badge_id
  end

  def check_tests_level(rule)
    all_tests = Test.where(level: @test_level).pluck(:id).sort
    user_tests = @user.tests_by_level(@test_level).pluck(:id).uniq.sort

    @badges_ids.push(Badge.where(rule: rule, value: @test_level).first&.id) if user_tests.eql?(all_tests)
  end

  def assign_badges_to_user(badges_ids)
    badges_ids.each { |id| add_badge_to_current_user(id) }
  end

  def add_badge_to_current_user(badge_id)
    BadgesUser.create!({ badge_id: badge_id,
                          user_id: @user.id })
  end
end
