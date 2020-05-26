class AddTimeFieldsToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :timer, :boolean, default: false
    add_column :tests, :duration, :integer, default: nil
  end
end
