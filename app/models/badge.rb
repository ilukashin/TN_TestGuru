class Badge < ApplicationRecord

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users


  RULES = %i[category attempts tests_level]

  def assign_to_user(rules)
    rules.each { |rule| add_badge_to_current_user(rule) }
  end

  private

  def add_badge_to_current_user(rule)
    BadgesUsers.create!({ badge_id: Badge.where(rule: rule).first.id,
                          user_id: current_user.id })
  end
end
