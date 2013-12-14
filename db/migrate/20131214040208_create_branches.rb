class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :address
      t.integer :start_hour
      t.integer :start_minute
      t.integer :end_hour
      t.integer :end_minute
      t.text :reference
      t.boolean :has_parking
      t.boolean :has_valet
      t.float :longitude
      t.float :latitude
      t.float :altitude
      t.integer :district_id
      t.integer :brand_id

      t.timestamps
    end
  end
end
