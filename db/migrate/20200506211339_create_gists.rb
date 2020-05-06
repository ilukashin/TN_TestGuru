class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :question
      t.string :url
      t.string :user_email

      t.timestamps
    end
  end
end
