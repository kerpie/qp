class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :branch_id
      t.integer :coupon_id

      t.timestamps
    end
  end
end
