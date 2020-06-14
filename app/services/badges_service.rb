class BadgesService

  attr_reader :badges
  
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user

    @badges = []

    check_all_conditions
  end
  
  private

  def check_all_conditions
    Badge::RULES.each { |rule| self.send("check_#{rule}") }
  end

  def check_test_category
    return unless @test_passage.success?

    test_category = @test_passage.test.category
    badge = find_badge('category', test_category.title)
    return unless badge.present?

    all_tests = test_category.tests.ids.sort
    user_tests = find_user_tests(all_tests, last_badge_time(badge))

    @badges.push(badge) if user_tests.eql?(all_tests)
  end

  def check_attempts
    return unless @test_passage.success?

    user_tests_attempts = @user.test_passages.where(test_id: Test.where(title: @test_passage.test.title)
                                                                                                 .ids)
                                             .count
    badge = find_badge('attempts', user_tests_attempts)

    @badges.push(badge) if badge.present?
  end

  def check_tests_level
    return unless @test_passage.success?

    test_level = @test_passage.test.level
    badge = find_badge('tests_level', test_level)
    return unless badge.present?

    all_tests = Test.where(level: test_level).ids.sort
    user_tests = find_user_tests(all_tests, last_badge_time(badge))

    @badges.push(badge) if user_tests.eql?(all_tests)
  end

  def find_badge(rule, value)
    Badge.where(rule: rule, value: value).first
  end

  def last_badge_time(badge)
    if @user.badges.include?(badge)
      @user.badges_user.where(badge_id: badge.id).last.created_at
    else
      DateTime.new
    end
  end

  def find_user_tests(test_ids, since_time)
    @user.test_passages.where(test_id: test_ids,
                              created_at: since_time..Time.zone.now)
                       .select { |tp| tp.success? }
                       .pluck(:test_id)
                       .uniq
                       .sort
  end
end
