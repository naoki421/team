class ChangeColumnToItem < ActiveRecord::Migration[6.1]
  def change
    change_column_null :items, :is_active, false
  end
end
