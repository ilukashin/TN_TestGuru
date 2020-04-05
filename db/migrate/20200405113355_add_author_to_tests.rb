class AddAuthorToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :author_id, :integer, default: 0, null: false
    add_index :tests, :author_id
  end
end
