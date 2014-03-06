class AddFavoriteToHistory < ActiveRecord::Migration
  def change
  	add_column :histories, :is_favorite, :boolean
  end
end
