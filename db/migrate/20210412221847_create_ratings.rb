class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :show, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :rating
      t.timestamps
    end
  end
end
