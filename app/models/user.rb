class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(level: level)
        .joins('JOIN tests_users on tests_users.test_id = tests.id')
        .where(tests_users: {user_id: self.id})
  end
end
