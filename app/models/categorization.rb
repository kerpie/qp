class Categorization < ActiveRecord::Base

	belongs_to :brand
	belongs_to :sub_category

end