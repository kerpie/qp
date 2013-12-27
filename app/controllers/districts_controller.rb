class DistrictsController < ApplicationController

	def create
		@district = District.new
		@district.city = City.find(params[:city_id])
		@district.name = params[:name]
		@district.save

		@districts = [@district]
		@count = @district.city.districts.count
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@district = District.find(params[:id]).destroy
		respond_to do |format|
			format.js
		end
	end

	def update
		@district = District.find(params[:district_id])
		@district.name = params[:new_district_name]
		@district.save

		@index = @district.city.districts.index(@district) + 1

		respond_to do |format|
			format.js
		end
	end

end