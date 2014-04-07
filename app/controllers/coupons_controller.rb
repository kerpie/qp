class CouponsController < ApplicationController

  before_action :set_coupon, only: [:show, :edit, :update, :destroy]
  before_action :set_values, only: [:index, :by_category, :by_sub_category, :favorites]
  
  def index
  	@coupons = Coupon.where("coupon_state_id = ? AND start_date <= ? AND end_date >= ?", CouponState.last.id, Time.zone.now.beginning_of_day, Time.zone.now.end_of_day)
  	@coupon_types = CouponType.all
    @most_visited_coupons = Coupon.most_visited
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @coupon = Coupon.new
    if brand_signed_in?
      @cities = []
      current_brand.branches.each do |branch|
        @cities << branch.district.city
      end
      @cities.uniq! unless @cities.count == 1

      @categories = []
      current_brand.sub_categories.each do |sub_category|
        @categories << sub_category.category
      end
      @categories.uniq! unless @categories.count == 1
    end
    respond_to do |format|
      unless admin_signed_in?
        #Brand session started
        unless current_brand.branches.count>0
          format.html {redirect_to root_path, notice: "Tienes que crear una tienda antes de poder crear cupones"}
        else
          format.html
        end
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
      value = false
      if current_user.coupons.exists?(@coupon) 
        h = current_user.histories.where(coupon_id: @coupon.id).first
        value = h.is_favorite
        h.destroy
      end
      @history = History.create(user_id: current_user.id, coupon_id: @coupon.id, is_favorite: value)
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    if brand_signed_in?
      @cities = []
      current_brand.branches.each do |branch|
        @cities << branch.district.city
      end
      @cities.uniq! unless @cities.count == 1
      @categories = []
      current_brand.sub_categories.each do |sub_category|
        @categories << sub_category.category
      end
      @categories.uniq! unless @categories.count == 1
    end
  end

  def update
    if brand_signed_in?
      @cities = []
      current_brand.branches.each do |branch|
        @cities << branch.district.city
      end
      @cities.uniq! unless @cities.count == 1
      @categories = []
      current_brand.sub_categories.each do |sub_category|
        @categories << sub_category.category
      end
      @categories.uniq! unless @categories.count == 1
    end
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

  def valid_coupons
    @coupons = current_brand.coupons.where("coupon_state_id = ? AND start_date <= ? AND end_date >= ?", CouponState.last.id, Time.zone.now.beginning_of_day, Time.zone.now.end_of_day)
    @coupon_types = CouponType.all
  end

  def published_coupons
    @brand = Brand.find(params[:id])
    @coupons = @brand.coupons.where(coupon_state_id: CouponState.where("name like ?", "%prob%").first.id)
    @coupon_types = []
    @brand.coupons.each do |coupon|
      @coupon_types << coupon.coupon_type
    end
    @coupon_types.uniq!
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
    @coupons = current_user.coupons.reverse
  end

  def favorites
    histories = History.where(user_id: current_user.id, is_favorite: true)
    @coupons = []
    histories.each do |h|
      @coupons << h.coupon if h.coupon.is_valid?
    end
    @coupon_types = CouponType.all
  end

  def mark_favorite
    history = History.where(user_id: params[:user_id], coupon_id: params[:coupon_id]).first
    history.is_favorite = params[:is_favorite]
    history.save
    respond_to do |format|
      format.html { redirect_to history.coupon }
    end
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

  def by_category
    @category = Category.find(params[:id])
    @category.sub_categories.each do |sub|
      @coupons = sub.coupons.where("coupon_state_id = ? AND start_date <= ? AND end_date >= ?", CouponState.last.id, Time.zone.now.beginning_of_day, Time.zone.now.end_of_day).each do |coupon|
        coupon
      end
    end
  end

  def by_sub_category
    @sub_category = SubCategory.find(params[:id])
    @coupons = @sub_category.coupons.where("coupon_state_id = ? AND start_date <= ? AND end_date >= ?", CouponState.last.id, Time.zone.now.beginning_of_day, Time.zone.now.end_of_day).each do |coupon|
      coupon
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
        :start_date_string,
        :end_date_string,
        {:branch_ids=>[]}, 
        {:sub_category_ids => []})
  	end

    def set_values
      @categories = Category.all
      @coupon_types = CouponType.all
    end
end