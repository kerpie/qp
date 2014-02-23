class Brands::SessionsController < Devise::SessionsController

	def create
		super
		if current_brand.name.nil? || current_brand.name.empty?
			set_flash_message :notice, :signed_in_with_incompleted_data
		end		
	end
end