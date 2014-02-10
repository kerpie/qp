class AddNameToBranches < ActiveRecord::Migration
  def change
  	add_column :branches, :name, :string
  end
end