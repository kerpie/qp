class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :brand_id
      t.integer :sub_category_id
      t.text :detail

      t.timestamps
    end
  end
end
