class CouponTypesController < ApplicationController
  def index
  	@coupon_types = CouponType.all
  end

  def create
  	@coupon_type = CouponType.new
  	@coupon_type.name = params[:coupon_type_new_name]
  	@coupon_type.save

  	@index = CouponType.all.index(@coupon_type) + 1
  	respond_to do |format|
  		format.js
  	end
  end

  def destroy
    @coupon_type = CouponType.find(params[:id]).destroy
    respond_to do |format|
      format.js
    end
  end

  def update
    @coupon_type = CouponType.find(params[:ct_id])
    @coupon_type.name = params[:new_coupon_type_name]
    @coupon_type.save
    @index = CouponType.all.index(@coupon_type) + 1
    respond_to do |format|
      format.js
    end
  end
end