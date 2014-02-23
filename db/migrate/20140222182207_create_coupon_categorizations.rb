class CreateCouponCategorizations < ActiveRecord::Migration
  def change
    create_table :coupon_categorizations do |t|
      t.integer :coupon_id
      t.integer :sub_category_id

      t.timestamps
    end
  end
end
