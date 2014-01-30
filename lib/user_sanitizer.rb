class UserParameterSanitizer<Devise::ParameterSanitizer

	private
	    def account_update
	        default_params.permit(:name, :last_name, :sex, :birthday, :email, :password, :password_confirmation, :current_password)
	    end

end