class User < ActiveRecord::Base

	has_many :histories
	has_many :coupons, through: :histories

end