class BrandParameterSanitizer<Devise::ParameterSanitizer
	
	private
	    def account_update
	        default_params.permit(:name, :email, :fb_link, :tw_link, :password, :password_confirmation, :current_password, :logo_image)
	    end

end