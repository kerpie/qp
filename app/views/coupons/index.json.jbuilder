json.array! @most_visited_coupons.each do |coupon|
	json.extract! coupon, :id, :name, :description
	json.promo_image coupon.promo_image.url
end