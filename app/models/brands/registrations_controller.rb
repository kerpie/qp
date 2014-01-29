class Brands::RegistrationsController < Devise::RegistrationsController

	def sign_up(resource_name, resource)
		if admin_signed_in?
			return
		else
			super
		end
	end

	def after_sign_up_path_for(resource)
		edit_brand_registration_path
	end

end