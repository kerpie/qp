class BrandsController < ApplicationController

  before_action :set_brand, only: [:edit, :update]

  def index
  	@brands = Brand.all
  end

  def edit

  end

  def update
  	respond_to do |format|
  		if @brand.update(brand_params)
  			format.html {redirect_to brands_index_path, notice: "Registro actualizado"}
  		else
  			format.html { render action: "edit" }
  		end
  	end
  end

  private

  def set_brand
	@brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name, :email, :fb_link, :tw_link, :logo_image)
  end
end