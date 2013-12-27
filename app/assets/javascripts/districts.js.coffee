$ ->
	$(document).on "click", ".up_district", ->
		$("#district_id").val($(this).data("id"))
		$("#new_district_name").val($(this).parent().prev().text().trim())
		$(this).parents("tr").addClass("toChange")