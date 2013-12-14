class Brand < ActiveRecord::Base

	has_many :categorizations
	has_many :sub_categories, through: :categorizations
	has_many :branches
	
end