class CouponsController < ApplicationController

  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  def index
  	@coupons = Coupon.all
  	@coupon_types = CouponType.all
  end

  def new
    @coupon = Coupon.new
  end

  def create
  	@coupon = Coupon.new(coupon_params)
    @coupon.discount = @coupon.discount/100

    if brand_signed_in?
      @coupon.brand_id = params[:brand_id]
    elsif admin_signed_in?
      @coupon.admin_id = params[:admin_id]
    end

  	respond_to do |format|
  		if @coupon.save
  			format.html { redirect_to @coupon, notice: "cupon creado" }
  			format.json { render action: "show", status: :created, location: @coupon }
  		else
  			format.html { render action: 'new' }
  			format.json { render json: @coupon.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def show
    if user_signed_in?
      current_user.coupon_ids = @coupon.id
    end
  end

  def edit
  end

  def update
  	respond_to do |format|
  		if @coupon.update(coupon_params)
  			format.html { redirect_to @coupon, notice: "cupon actualizado" }
  			format.json { head :no_content }
  		else
  			format.html { render action: 'edit' }
  			format.json { render json: @coupon.errors, status: :unprocessable_entity }
  		end
  	end
  end

  def destroy
  	@coupon.destroy
  	respond_to do |format|
  		format.html { redirect_to coupons_path }
  		format.json { head :no_content }
  	end
  end

  def saved_coupons
    @brand = Brand.find(params[:id])
    @coupons = @brand.coupons.where(coupon_state_id: CouponState.where("name like ?", "%uar%").first.id)
    @coupon_types = CouponType.all
    respond_to do |format|
      format.html
    end
  end

  def history
    @coupon_types = CouponType.all
    @coupons = current_user.coupons
  end

  private

  	def set_coupon
  		@coupon = Coupon.find(params[:id])
  	end

  	def coupon_params
		  params.require(:coupon).permit(:name, :description, :start_date, :end_date, :discount, :coupon_type_id, :coupon_state_id, { :branch_ids => []})
  	end
end