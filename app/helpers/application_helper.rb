module ApplicationHelper

	def boolean_select(id)
		options = "<option value=\"0\">No</option><option value=\"1\">Si</option>"
		select_tag id, options.html_safe
	end

	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end

	def categories
		coupons = []
		History.all.each do |history|
			coupons << history.coupon if history.coupon.is_valid?
		end
		@popular_categories = []
		coupons.each do |coupon|
			coupon.sub_categories.each do |sub|
				@popular_categories << sub.category
			end
		end
		@popular_categories.uniq! unless @popular_categories.count == 1
		@categories = Category.all

		render "layouts/categories", categories: @categories, popular_categories: @popular_categories
	end

end