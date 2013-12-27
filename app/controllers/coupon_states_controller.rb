class CouponStatesController < ApplicationController
  def index
  	@coupon_states = CouponState.all
  end

  def create
  	@coupon_state = CouponState.new
  	@coupon_state.name = params[:coupon_state_new_name]
  	@coupon_state.save

  	@index = CouponState.all.index(@coupon_state) + 1
  	respond_to do |format|
  		format.js
  	end
  end

  def destroy
    @coupon_state = CouponState.find(params[:id]).destroy
    respond_to do |format|
      format.js
    end
  end

  def update
    @coupon_state = CouponState.find(params[:cs_id])
    @coupon_state.name = params[:new_coupon_state_name]
    @coupon_state.save
    @index = CouponState.all.index(@coupon_state) + 1
    respond_to do |format|
      format.js
    end
  end
end