class AddFbAttributesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :fb_id, :string
  	add_column :users, :fb_photo, :string
  end
end
