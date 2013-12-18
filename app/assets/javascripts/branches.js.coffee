jQuery ->
	districts = $("#district_id").html()
	$("#city").change ->
		city = $("#city :selected").text()
		options = $(districts).filter("optgroup[label=\"#{city}\"]").html()
		if options 
			$("#district_id").html(options)
		else
			$("#district_id").empty()
