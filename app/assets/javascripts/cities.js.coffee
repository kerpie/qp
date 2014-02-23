$ ->
	$(document).on "click", "a[class='accordion-toggle']", ->
		$("#city_id").val($(this).data("id"))
		$("#new_name").val($(this).text())

$ ->
	$(document).on "click", "a[class='destroy_link']", ->
		$(this).addClass("toDestroy")

$ ->
	$(document).on "click", "a[class='destroy_dt']", ->
		$(this).addClass("destroyThisDistrict")

$ ->
	$(document).on 'click',".update_city_link", ->
		link = $(this).parents(".accordion-group").find(".accordion-heading a")
		console.log link
		$("#new_latitude").val($(link).data("latitude"))
		$("#new_longitude").val($(link).data("longitude"))

$ ->
	$("#new_city_form").on 'shown',  ->
		$(this).parent()[0].reset()