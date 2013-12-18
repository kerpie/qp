class BranchesController < ApplicationController

  def index
  	@branches = Branch.where(brand_id: params[:id])
  end

  def create

  	@branch = Branch.new
  	@branch.brand = Brand.find(params[:brand_id])
  	@branch.address = params[:address]
  	@branch.reference = params[:reference]
  	@branch.start_hour = params[:start_hour]
  	@branch.start_minute = params[:start_minute]
  	@branch.end_hour = params[:end_hour]
  	@branch.end_minute = params[:end_minute]
  	@branch.has_parking = params[:has_parking] == 1 ? true : false
  	@branch.has_valet = params[:has_valet] == 1 ? true : false
  	@branch.altitude = params[:altitude]
  	@branch.longitude = params[:longitude]
  	@branch.altitude = params[:altitude]
  	@branch.district_id = params[:district_id]
  	@branch.save
  	respond_to do |format|
		format.js
  	end
  end

end