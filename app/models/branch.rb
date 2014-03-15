class Branch < ActiveRecord::Base

	belongs_to :district
	belongs_to :brand
	
	has_many :availabilities, dependent: :destroy
	has_many :coupons, through: :availabilities

end