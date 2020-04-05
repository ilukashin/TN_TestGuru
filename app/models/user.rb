class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'


  def tests_by_level(level)
    Test.where(level: level)
        .joins('JOIN tests_users on tests_users.test_id = tests.id')
        .where(tests_users: {user_id: self.id})
  end
end
