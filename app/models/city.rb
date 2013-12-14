class City < ActiveRecord::Base

	has_many :districts
	has_many :branches, through: :districts
end