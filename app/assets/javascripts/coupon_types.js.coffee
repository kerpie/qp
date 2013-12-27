$ ->
	$(document).on "click","a[class='ct_destroy_link']", ->
		$(this).addClass("remove_this_row")

	$(document).on "click", "a[class='ct_update_link']", ->
		$(this).addClass("update_this_row")
		$("#ct_id").val($(this).data("id"))
		$("#new_coupon_type_name").val($(this).parent().prev().text().trim())