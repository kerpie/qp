class Availability < ActiveRecord::Base

	belongs_to :branch
	belongs_to :coupon

end