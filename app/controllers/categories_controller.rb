class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		respond_to do |format|
			format.html
			format.json
		end
	end

	def show
		@category = Category.find(params[:id])
		@subcategories = @category.sub_categories
		respond_to do |format|
		  format.js
  		end
	end

	def create
		@category = Category.new
		@category.name = params[:name]
		@category.save
		respond_to do |format|
			format.js
		end
	end

	def update
		@category = Category.find(params[:cat_id])
		@category.name = params[:new_name]
		@category.save
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@category = Category.find(params[:id]).destroy()
		respond_to do |format|
			format.js
		end
	end
end