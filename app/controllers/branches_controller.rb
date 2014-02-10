class BranchesController < ApplicationController

  def index
    @brand = Brand.find(params[:id])
  	@branches = Branch.where(brand_id: params[:id])
  end

  def create

  	@branch = Branch.new
  	@branch.brand = Brand.find(params[:brand_id])
    @branch.name = params[:name]
  	@branch.address = params[:address]
  	@branch.reference = params[:reference]
  	@branch.start_hour = params[:start_hour]
  	@branch.start_minute = params[:start_minute]
  	@branch.end_hour = params[:end_hour]
  	@branch.end_minute = params[:end_minute]
  	@branch.has_parking = params[:has_parking] == "1" ? true : false
  	@branch.has_valet = params[:has_valet] == "1" ? true : false
  	@branch.latitude = params[:latitude]
  	@branch.longitude = params[:longitude]
  	@branch.altitude = params[:altitude]
  	@branch.district_id = params[:district_id]
  	@branch.save
    
  	respond_to do |format|
		  format.js
  	end
  end

  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy
    respond_to do |format|
      format.js
    end
  end

  def edit
    @branch = Branch.find(params[:branch_id])
    @branch.brand = Brand.find(params[:brand_id])
    @branch.name = params[:edit_name]
    @branch.address = params[:edit_address]
    @branch.reference = params[:edit_reference]
    @branch.start_hour = params[:edit_start_hour]
    @branch.start_minute = params[:edit_start_minute]
    @branch.end_hour = params[:edit_end_hour]
    @branch.end_minute = params[:edit_end_minute]
    @branch.has_parking = (params[:edit_has_parking] == "1") ? true : false
    @branch.has_valet = (params[:edit_has_valet] == "1") ? true : false
    @branch.latitude = params[:edit_latitude]
    @branch.longitude = params[:edit_longitude]
    @branch.altitude = params[:edit_altitude]
    @branch.district_id = params[:edit_district_id]

    @branch.save
    respond_to do |format|
      format.js
    end

  end

  def grouped_branches

    @brand = Brand.find(params[:brand_id])
    @branches = @brand.branches

    @coupon = (params[:c_id].nil? || params[:c_id].empty?) ? Coupon.new : Coupon.find(params[:c_id])

    respond_to do |format|
      format.js
    end
  end

  def branches_in_district
    @brand = Brand.find(params[:brand_id])
    @branches = @brand.branches.where(district_id: params[:district_id])
    @coupon = (params[:coupon_id] == "-1") ? Coupon.new : Coupon.find(params[:coupon_id])
    respond_to do |format|
      format.js
    end
  end
end