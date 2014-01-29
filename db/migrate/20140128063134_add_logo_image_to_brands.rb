class AddLogoImageToBrands < ActiveRecord::Migration
  def change
  	add_column :brands, :logo_image_file_name, :string
  	add_column :brands, :logo_image_content_type, :string
  	add_column :brands, :logo_image_file_size, :integer
  	add_column :brands, :logo_image_updated_at, :datetime
  end
end
