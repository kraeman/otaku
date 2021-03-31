class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :bio
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
