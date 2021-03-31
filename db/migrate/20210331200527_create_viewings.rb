class CreateViewings < ActiveRecord::Migration[6.1]
  def change
    create_table :viewings do |t|
      t.datetime :time
      t.string :place
      t.references :show, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
