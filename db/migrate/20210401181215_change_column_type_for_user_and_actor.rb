class ChangeColumnTypeForUserAndActor < ActiveRecord::Migration[6.1]
  def change
    change_table :actors do |t|
      t.change :dob, :date
    end
    change_table :users do |t|
      t.change :dob, :date
    end
  end
end
