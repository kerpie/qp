module CouponsHelper

	def coupon_locations(locations)
		start_tag = "<select id=\"coupon_locations\">"
		end_tag = "</select>"
		middle_tag = ""
		locations.each do |branch|
			middle_tag += "<option data-lat=\"#{branch.latitude}\" data-lng=\"#{branch.longitude}\" data-address=\"#{branch.address}\">#{branch.name} - #{branch.district.city.name}</option>"
		end
		return (start_tag + middle_tag + end_tag).html_safe
	end

end