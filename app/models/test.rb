class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.by_category(name)
    Test.select(:title).joins(:category).where('categories.title': name).order(id: :desc)
  end
end
