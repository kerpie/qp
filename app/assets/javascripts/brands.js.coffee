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