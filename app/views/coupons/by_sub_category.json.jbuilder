if(@coupons.count >= 1)
	json.status true
	json.coupons @coupons.each do |coupon|
		json.extract! coupon, :id, :name, :promo_image
	end
else
	json.status false
end