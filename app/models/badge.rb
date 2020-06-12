class Badge < ApplicationRecord

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  RULES = %i[test_category attempts tests_level category_backend]

end
