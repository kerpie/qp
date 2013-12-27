$ ->
	$(document).on "click", ".up_sub_cat", ->
		$("#sub_cat_id").val($(this).data("id"))
		$("#new_sub_name").val($(this).parent().prev().text().trim())
		$(this).parents("tr").addClass("toChange")