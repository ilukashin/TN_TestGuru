class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false

      # TODO: this two string-typed while feature developing
      t.string :logo, null: false
      t.string :rule, null: false

      t.timestamps
    end
  end
end
