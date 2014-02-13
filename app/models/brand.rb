class Brand < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise	:database_authenticatable, 
			:registerable,
			:recoverable,
			:rememberable,
			:trackable,
			:validatable

	has_many :categorizations
	has_many :sub_categories, through: :categorizations
	
	has_many :branches

	has_many :coupons

	has_attached_file :logo_image, styles: {
		medium: "150x150>",
		small: "50x50>"
	}, 
	path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
	url: "/system/:class/:attachment/:id/:style/:filename"

	def safe_name
		if name.nil? || name.empty?
			"Nombre no registrado"
		else
			name
		end
	end
end