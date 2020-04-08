class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  # кажется, что скоупы сделаны для упрощения чтения класса
  # и лучше писать их в одну строчку в виде { блока кода },
  # но тогда строка будет слишком длинной, поэтому я оставил написание таким
  # вопрос: какие best-pracrice в таких случаях?
  scope :by_category, -> (name) do
    joins(:category)
      .where(categories: {title: name})
      .order(title: :desc)
      .pluck(:title)
  end
end
