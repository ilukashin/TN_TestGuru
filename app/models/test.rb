class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  def self.by_category(name)
    joins(:category)
      .where(categories: {title: name})
      .order(title: :desc)
      .pluck(:title)
  end
end
