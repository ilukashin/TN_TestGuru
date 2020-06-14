class AddTimestampsToBadgesUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :badges_users, :created_at, :datetime, null: false, default: Time.zone.now
    add_column :badges_users, :updated_at, :datetime, null: false, default: Time.zone.now
  end
end
