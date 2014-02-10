class CitiesController < ApplicationController

	def index
		@cities = City.all
	end

	def show
		@city = City.find(params[:id])
		@districts = @city.districts
		respond_to do |format|
		  format.js
  		end
	end

	def create
		@city = City.new
		@city.name = params[:name]
		@city.save
		respond_to do |format|
			format.js
		end
	end

	def update
		@city = City.find(params[:city_id])
		@city.name = params[:new_name]
		@city.save
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@city = City.find(params[:id]).destroy()
		respond_to do |format|
			format.js
		end
	end

	def search_districts_for_city
		@districts = City.find(params[:city_id]).districts
		respond_to do |format|
			format.js
		end
	end
end