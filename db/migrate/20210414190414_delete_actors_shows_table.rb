class DeleteActorsShowsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :actors_shows
  end
end
