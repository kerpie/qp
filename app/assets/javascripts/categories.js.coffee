$ ->
	$(document).on "click", "a[class='accordion-toggle']", ->
		$("#cat_id").val($(this).data("id"))
		$("#new_name").val($(this).text())

$ ->
	$(document).on "click", "a[class='destroy_link']", ->
		$(this).addClass("toDestroy")

$ ->
	$(document).on "click", "a[class='destroy_sb']", ->
		$(this).addClass("destroyThisSb")