class FixDobColumnForActorDataType < ActiveRecord::Migration[6.1]
  def change
    change_table :actors do |t|
      t.change :dob, :datetime
    end
  end
end
