class ChangeColumnTypeOfAirTimeInShow < ActiveRecord::Migration[6.1]
  def change
    change_column :shows, :air_time, :decimal
  end
end
