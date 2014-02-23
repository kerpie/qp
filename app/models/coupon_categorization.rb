class CouponCategorization < ActiveRecord::Base

	belongs_to :sub_category
	belongs_to :coupon

end