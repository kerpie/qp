class CouponsController < ApplicationController

  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  def index
  	@coupons = Coupon.where(coupon_state: CouponState.where("name like ?", "%prob%").first)
  	@coupon_types = CouponType.all
  end

  def new
    @coupon = Coupon.new
    respond_to do |format|
      unless current_brand.branches.count>0
        format.html {redirect_to root_path, notice: "Tienes que crear una tienda antes de poder crear cupones"}
      else
        format.html
      end
    end
  end

  def create
  	@coupon = Coupon.new(coupon_params)
    unless @coupon.discount.nil?
      @coupon.discount = @coupon.discount/100
    end

=begin
if brand_signed_in?
      @coupon.brand = Brand.find(params[:brand_id])
    elsif admin_signed_in?
      @coupon.admin_id = params[:admin_id]
    end
=end


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

  def published_coupons
    @brand = Brand.find(params[:id])
    @coupons = @brand.coupons.where(coupon_state_id: CouponState.where("name like ?", "%prob%").first.id)
    @coupon_types = CouponType.all
    respond_to do |format|
      format.html
    end
  end

  def pending_coupons_by_brand
    @brand = Brand.find(params[:id])
    @coupons = @brand.coupons.where(coupon_state_id: CouponState.where("name like ?", "%endi%").first.id)
    @coupon_types = CouponType.all
    respond_to do |format|
      format.html
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

  def pending_coupons
    @coupons = Coupon.where(coupon_state_id: CouponState.where("name like ?", "%pendi%"))
    @coupon_types = CouponType.all
  end

  def approve_coupon
    
    @coupon = Coupon.find(params[:id])
    @coupon.coupon_state_id = CouponState.last.id
    @coupon.admin_id = params[:admin_id]
    @coupon.save
    
    respond_to do |format|
      format.js
    end

  end

  private

  	def set_coupon
  		@coupon = Coupon.find(params[:id])
  	end

  	def coupon_params
		  params.require(:coupon).permit(
        :name, 
        :description, 
        :start_date, 
        :end_date, 
        :discount, 
        :coupon_type_id, 
        :coupon_state_id, 
        :brand_id,
        :promo_image, 
        {:branch_ids=>[]})
  	end
end