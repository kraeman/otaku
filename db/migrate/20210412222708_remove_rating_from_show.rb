class RemoveRatingFromShow < ActiveRecord::Migration[6.1]
  def change
    remove_column :shows, :rating
  end
end
