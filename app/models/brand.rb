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
end