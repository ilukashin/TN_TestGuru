class Test < ApplicationRecord
  belongs_to :category

  def self.by_category(name)
    Test.select(:title).joins(:category).where('categories.title': name).order(id: :desc)
  end
end
