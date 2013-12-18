class AddBrandIdToBranch < ActiveRecord::Migration
  def change
  	add_column :coupons, :brand_id, :integer
  	add_column :coupons, :admin_id, :integer
  end
end