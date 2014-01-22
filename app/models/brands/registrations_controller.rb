class Brands::RegistrationsController < Devise::RegistrationsController

	def sign_up(resource_name, resource)
		if admin_signed_in?
			return
		else
			super
		end
	end

end