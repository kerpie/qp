jQuery ->
	$("#coupon_discount").keyup ->
		value = $(this).val()
		message = ""
		unless($.isNumeric(value))
			message += "No es un número, por favor ingrese un valor numérico válido (0 a 100)<br/>"
			$(this).val(value.substring(0, value.length - 1))
		if value > 100
			message += "El valor no puede ser mayor a 100<br>"
		if value < 0 
			message += "El valor no puede ser menor a 0<br>"
		$("#discount_error_message").html(message)

jQuery ->
	$("#city_to_search").change ->
		value = $(this).val()
		$.ajax({
          type: "POST",
          url: "/cities/search_districts_for_city", 
          data: {
            city_id: value,
          }
        });

jQuery ->
	$(document).on 'change','#district_to_search',->
		value = $(this).val()
		brand = $("#coupon_brand_id").val()
		$.ajax({
			type: "POST",
			url: "/branches/branches_in_district",
			data: {
				district_id: value,
				brand_id: brand, 
				coupon_id: $("#is_new_coupon").val()
			}
		})