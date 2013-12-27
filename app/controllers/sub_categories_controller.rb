class SubCategoriesController < ApplicationController

	def create
		@subcategory = SubCategory.new
		@subcategory.category = Category.find(params[:category_id])
		@subcategory.name = params[:name]
		@subcategory.save

		@subcategories = [@subcategory]
		@count = @subcategory.category.sub_categories.count
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@subcategory = SubCategory.find(params[:id]).destroy
		respond_to do |format|
			format.js
		end
	end

	def update
		@subcategory = SubCategory.find(params[:sub_cat_id])
		@subcategory.name = params[:new_sub_name]
		@subcategory.save

		@index = @subcategory.category.sub_categories.index(@subcategory) + 1

		respond_to do |format|
			format.js
		end
	end

end