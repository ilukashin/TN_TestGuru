class User < ApplicationRecord
  def tests_by_level(level)
    User.joins('JOIN tests_users on tests_users.user_id = users.id')
        .where(users: { id: id })
        .joins('JOIN tests on tests.id = tests_users.test_id')
        .where(tests: { level: level })
        .pluck('tests.title')
  end
end
