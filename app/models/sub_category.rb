class SubCategory < ActiveRecord::Base

	belongs_to :category
	has_many :categorizations
	has_many :brands, through: :categorizations

	has_many :coupon_categorizations
	has_many :coupons, through: :coupon_categorizations

	def self.brands_by_sub_category(sub_category_id)
		sub_cat = SubCategory.find(sub_category_id)
		brands = []
		sub_cat.brands.each do |brand|
			brands << brand
		end
		unless brands.count == 1
			brands.uniq!
		end
		brands
	end

end