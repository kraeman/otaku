class CreateActorsShows < ActiveRecord::Migration[6.1]
  def change
    create_table :actors_shows do |t|
      t.references :actor, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
