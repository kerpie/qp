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