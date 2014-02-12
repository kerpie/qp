$ ->
	$("#coupon_brand_id").change ->
		value = $(this).val()
		c_id = $(this).data("coupon-id")
		$.ajax({
          type: "POST",
          url: "/branches/grouped_branches", 
          data: {
            brand_id: value,
            coupon_id: c_id
          }
        });
$ ->
  $("#click_to_show_password").click (e)->
    e.preventDefault()
    $(this).parent().hide()
    $(".hide_until_click").each ->
      $(this).show()

$ ->
  $("#click_to_change_logo").click (e) ->
    e.preventDefault()
    $(this).hide()
    $(".to_show").show()

$ ->
  $("#categories_in_edit_brand").change ->
    $("#sub_categories_go_here").show()
    $(".sub_category").each ->
      $(this).hide()
    $("#category_" + $(this).val()).show()