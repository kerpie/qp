class Coupon < ActiveRecord::Base
	
	belongs_to :coupon_type
	belongs_to :coupon_state

	has_many :availabilities
	has_many :branches, through: :availabilities

	has_many :histories
	has_many :users, through: :histories

	belongs_to :brand

end