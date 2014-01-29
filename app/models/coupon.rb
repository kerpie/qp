class Coupon < ActiveRecord::Base
	
	belongs_to :coupon_type
	belongs_to :coupon_state

	has_many :availabilities
	has_many :branches, through: :availabilities

	has_many :histories
	has_many :users, through: :histories

	has_attached_file :promo_image, 
	path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
	url: "/system/:class/:attachment/:id/:style/:filename"

	belongs_to :brand

	#Validations

	validates :name, :description, :discount, presence: { message: " no puede estar vacío"}
	
end