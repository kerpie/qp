class AddFbAttributesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
  	add_column :users, :fb_photo_url, :string
  end
end
