class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def devise_parameter_sanitizer
    if resource_class == Brand
      BrandParameterSanitizer.new(Brand, :brand, params)
    elsif resource_class == User
      UserParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end

  def after_sign_in_path_for(resource)
    if resource_class == Brand
      coupons_published_path(current_brand.id)
    else
      root_path
    end
  end
end