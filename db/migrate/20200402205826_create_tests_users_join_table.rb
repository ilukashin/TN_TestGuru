class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tests, :users do |t|
      t.index [:test_id, :user_id], unique: true
    end
  end
end
