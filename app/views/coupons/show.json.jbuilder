json.extract! @coupon, :id, :name, :description
json.promo_image @coupon.promo_image.url
json.availability @coupon.availabilities.each do |availability|
	json.name availability.branch.name
	json.latitude availability.branch.latitude
	json.longitude availability.branch.longitude
end