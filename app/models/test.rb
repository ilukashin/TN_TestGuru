class Test < ApplicationRecord
  def self.by_category(name)
    joins('JOIN categories on categories.id = tests.category_id')
      .where('categories.title = ?', name)
      .order('tests.title': :desc)
      .pluck('tests.title')
  end
end
