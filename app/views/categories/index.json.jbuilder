json.array!(@categories) do |categories|
	json.extract! categories, :id, :name
	json.sub_categories categories.sub_categories.each do |sc|
		json.extract! sc, :id, :name
	end
end