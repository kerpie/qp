module ApplicationHelper

	def boolean_select(id)
		options = "<option value=\"0\">No</option><option value=\"1\">Si</option>"
		select_tag id, options.html_safe
	end

	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end

end