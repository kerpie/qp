class Coupon < ActiveRecord::Base
	
	belongs_to :coupon_type
	belongs_to :coupon_state

	has_many :availabilities
	has_many :branches, through: :availabilities

	has_many :histories
	has_many :users, through: :histories

	has_attached_file :promo_image, styles: {
			medium: "300x300>",
			small: "100x100>"
		},
	path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
	url: "/system/:class/:attachment/:id/:style/:filename"

	belongs_to :brand

	#Validations

	validates :name, :description, :discount, presence: { message: " no puede estar vacío"}
	
	attr_accessor :start_date_string
	attr_accessor :end_date_string

	before_validation :parse_date

	def parse_date
		unless self.start_date_string.nil? || self.start_date_string == ''
			self.start_date = DateTime.strptime self.start_date_string, "%m/%d/%Y"
		end
		unless self.start_date_string.nil? || self.start_date_string == ''
			self.end_date = DateTime.strptime self.end_date_string, "%m/%d/%Y"
		end
	end

end