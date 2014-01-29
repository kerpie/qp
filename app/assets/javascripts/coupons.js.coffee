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