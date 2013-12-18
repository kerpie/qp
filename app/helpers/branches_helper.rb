module BranchesHelper

	def attention_time(time_of_day)
		hour_options = ""
		24.times do |i|
			hour_options = hour_options + "<option value=\"#{i}\">#{i}</option>"
		end
		minutes_options = ""
		60.times do |i|
			minutes_options = minutes_options + "<option value=\"#{i}\">#{i}</option>"
		end
		selects = (select_tag "#{time_of_day}_hour", hour_options.html_safe, class: "small-select") + (select_tag "#{time_of_day}_minute", minutes_options.html_safe, class: "small-select")
	end
end