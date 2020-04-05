class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def self.by_category(name)
    joins('JOIN categories on categories.id = tests.category_id')
      .where(categories: {title: name})
      .order(title: :desc)
      .pluck(:title)
  end
end
