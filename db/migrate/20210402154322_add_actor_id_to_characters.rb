class AddActorIdToCharacters < ActiveRecord::Migration[6.1]
  def change
    add_reference :characters, :actor, null: false, foreign_key: true
  end
end
