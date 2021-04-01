class FixAgeColumnForActor < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :age, :dob
  end
end
