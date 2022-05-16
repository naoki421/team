class RemoveIsActivFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :is_activ, :boolean
  end
end
