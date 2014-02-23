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
	###$("#city_to_search").change ->
		value = $(this).val()
		$.ajax({
          type: "POST",
          url: "/cities/search_districts_for_city", 
          data: {
            city_id: value,
          }
        });###

jQuery ->
	$(document).on 'change','#district_to_search',->
		id = $(this).val()
		$(".branch_item").each ->
			$(this).hide()
		$("."+id).each ->
			$(this).show()
		###
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
		})###

jQuery ->
	$(document).on 'change','#category_to_search',->
		id = $(this).val()
		$(".sub_category_item").each ->
			$(this).hide()
		$(".cat_"+id).each ->
			$(this).show()

jQuery ->
	$(document).ready ->
		container = $(".projects")
		$(container).attr('style', $(".projects").attr("style") + "padding:10px;");
		$(container).find(".element").each ->
			$(this).attr("style", $(this).attr("style") + "margin-top: 10px;");

send_form = false;

jQuery ->
	$("#new_coupon").submit (event)->
		if send_form == false && $("#coupon_coupon_state_id  option:last").is(":selected")
			$("#confirmation_title_value").text($("#coupon_name").val())
			$("#confirmation_description_value").text $("#coupon_description").val()
			$("#confirmation_start_date_value").text $("#coupon_start_date_string").val()
			branches = ""
			$(".branches_in_district").find(".district_checkbox").each ->
				label = $(this)
				if $(label).prev().is(":checked")
					branches += "<li>" + $(label).text() + "</li>"
			$("#confirmation_availability").html branches
			$("#confirmation_end_date_value").text $("#coupon_end_date_string").val()
			$("#confirmation_coupon_type_value").text $("#coupon_coupon_type_id option:selected").text()
			$("#coupon_creation_confirmation").modal 'show'
			event.preventDefault()
		else 
			$("#coupon_creation_confirmation").modal 'hide'

jQuery ->
	$("#confirm_coupon_creation").click (event)->
		if $("#accept_creation_checkbox").is(":checked")
			send_form = true;
			$("#new_coupon").submit()
		else
			alert "Tiene que aceptar los TOS para poder continuar"
		event.preventDefault()

jQuery ->
	$("#coupon_promo_image").change ->
		upload_image(this)

upload_image = (input)->
	console.log "Starting image loading"
	value = (input.files && input.files[0])
	console.log value
	if input.files && input.files[0]
		console.log "Filter passed"
		reader = new FileReader()
		reader.onload = (e) ->
			$('#image_preview').attr("src", e.target.result)
			$('#image_preview').show()
			$('#confirmation_image').attr("src", e.target.result)
		reader.readAsDataURL(input.files[0])