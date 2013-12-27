$ ->
	$(document).on "click","a[class='cs_destroy_link']", ->
		$(this).addClass("remove_this_row")

	$(document).on "click", "a[class='cs_update_link']", ->
		$(this).addClass("update_this_row")
		$("#cs_id").val($(this).data("id"))
		$("#new_coupon_state_name").val($(this).parent().prev().text().trim())