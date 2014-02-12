class Category < ActiveRecord::Base

	has_many :sub_categories

	def self.brands_by_category(category_id)
		category = Category.find(category_id)
		brands = []
		category.sub_categories.each do |sub_cat|
			sub_cat.brands.each do |brand|
				brands << brand
			end
		end
		brands.uniq!
	end
end
