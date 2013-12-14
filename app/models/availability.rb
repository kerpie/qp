class Availability < ActiveRecord::Base

	belongs_to :branch_id
	belongs_to :coupon_id

end