class AddCvoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cvo, :boolean, default: false
  end
end
