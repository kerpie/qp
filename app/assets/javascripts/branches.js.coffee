jQuery ->
	districts = $("#district_id").html()
	$("#city").change ->
		city = $("#city :selected").text()
		options = $(districts).filter("optgroup[label=\"#{city}\"]").html()
		if options 
			$("#district_id").html(options)
		else
			$("#district_id").empty()

	edit_districts = $("#edit_district_id").html()
	$("#edit_city").change ->
		city = $("#edit_city :selected").text()
		options = $(edit_districts).filter("optgroup[label=\"#{city}\"]").html()
		if options 
			$("#edit_district_id").html(options)
		else
			$("#edit_district_id").empty()		

	$(".click_to_edit_branch").click ->
		parent = $(this).parents(".accordion-group")
		$(parent).addClass("to_change")

		branch_id = $(parent).find(".accordion-toggle").data("id")

		name = $(parent).find(".name").text().trim()
		address = $(parent).find(".address").text().trim()
		reference = $(parent).find(".reference").text().trim()
		
		parking = $(parent).find(".parking").text().trim()
		console.log("parking: " + parking)
		valet = $(parent).find(".valet").text().trim()
		console.log("valet: " + valet)

		start_hour = $(parent).find("#to_edit_start_hour").val()
		start_minute = $(parent).find("#to_edit_start_minute").val()
		end_hour = $(parent).find("#to_edit_end_hour").val()
		end_minute = $(parent).find("#to_edit_end_minute").val()
		district = $(parent).find(".district").data("id")
		city = $(parent).find(".city").data("id")
		latitude = $(parent).find(".latitude").text().trim()
		longitude = $(parent).find(".longitude").text().trim()
		altitude = $(parent).find(".altitude").text().trim()

		$("#branch_id").val(branch_id)
		$("#edit_name").val(name)
		$("#edit_address").val(address)
		$("#edit_reference").val(reference)

		temporal = null
		if(parking == "Si")
			temporal = 1
		else
			temporal = 0
		$("#edit_has_parking").val(temporal)

		temporal = null
		if(valet == "Si")
			temporal = 1
		else
			temporal = 0

		$("#edit_has_valet").val(temporal)

		$("#edit_start_hour").val(start_hour)
		$("#edit_start_minute").val(start_minute)
		$("#edit_end_hour").val(end_hour)
		$("#edit_end_minute").val(end_minute)
		$("#edit_city").val(city)
		$("#edit_district_id").val(district)
		$("#edit_latitude").val(latitude)
		$("#edit_longitude").val(longitude)
		$("#edit_altitude").val(altitude)			