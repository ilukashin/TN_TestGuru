class AddForeignKeyToGists < ActiveRecord::Migration[6.0]
  def change
    add_reference :gists, :question, foreign_key: :true
    rename_column(:gists, :question, :title)
  end
end
