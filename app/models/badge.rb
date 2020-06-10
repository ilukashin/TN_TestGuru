class Badge < ApplicationRecord

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

end
