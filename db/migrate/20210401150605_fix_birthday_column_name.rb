class FixBirthdayColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :DOB, :dob
  end
end
