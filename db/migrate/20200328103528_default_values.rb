class DefaultValues < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tests, :level, 1)

    change_column_default(:answers, :is_correct, false)
  end
end
