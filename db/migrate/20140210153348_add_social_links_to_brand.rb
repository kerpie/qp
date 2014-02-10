class AddSocialLinksToBrand < ActiveRecord::Migration
  def change
  	add_column :brands, :fb_link, :string
  	add_column :brands, :tw_link, :string
  end
end
