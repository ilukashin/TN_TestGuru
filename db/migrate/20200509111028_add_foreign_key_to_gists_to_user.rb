class AddForeignKeyToGistsToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :gists, :user, foreign_key: :true
    remove_column :gists, :user_email
  end
end
