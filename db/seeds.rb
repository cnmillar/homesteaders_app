# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Seed categories

[
	{
		name: "Beekeeping", 
		description: "Projects for working with honeybees and local pollinators like mason bees and bumblebees!"	
	},
	{
		name: "Dairy & Curd", 
		description: "Projects for making cheese, yogurt, butter, ice cream, and other dairy or non-dairy curds!"
	},
	{
		name: "Coffee & Tea", 
		description: "Projects using green coffee, roasting supplies, grinders, and steepers."
	},
	{
		name: "Composting", 
		description: "Projects for composting and building composters for small spaces."
	},
	{
		name: "Fermentation", 
		description: "Composting and composters for small spaces."
	},
	{
		name: "Fibrecrafts", 
		description: "Projects using yarn, wool, and plant fibres."
	},
	{
		name: "Fungiculture", 
		description: "Projects for growing mushrooms!"
	},
	{
		name: "Garden & Permaculture", 
		description: "Organic gardening and permaculture projects."
	},
	{
		name: "Grains & Baking", 
		description: "Projects for baking with whole grains, using flour mills, proofing baskets, baking pans, sourdough cultures, and more!"
	},
	{
		name: "Lifestyle", 
		description: "Projects for a low-impact, sustainable lifestyle."
	},
	{
		name: "Micro-livestock", 
		description: "Projects related to backyard chickens and other small critters!"
	},
	{
		name: "Preserving", 
		description: "Putting up food, in jars and otherwise!"
	},	
	{
		name: "Soap & Candle", 
		description: "Projects for making soaps, lotions, salves, tinctures, candles, cosmetics, and other similar household products."
	},
	{
		name: "Superfoods", 
		description: "Projects for making sprouts, microgreens, wheatgrass juice, nut milk, and other high energy, high nutrient foods!"
	},
	{
		name: "Water Conservation", 
		description: "Projects for collecting and conserving water!"
	},
	{
		name: "Whole Animal", 
		description: "Projects for making use of the entire animal, from sausage making to curing prime cuts to rendering fat and bone!"
	}
	# ,
	# {
	# 	name: "Food Storage", 
	# 	description: "Projects using stainless, food-grade plastic, and mylar food storage solutions."
	# },
	# {
	# 	name: "Kitchen Basics", 
	# 	description: "Durable goods for your kitchen."
	# }
].each do |cat|
	category = Category.where(:name => cat[:name]).first_or_create { |category|
		category.update_attributes(cat)
	}
	unless category.persisted?
		puts "Could not create category #{category.errors.full_messages}"
	end
end

# Seed projects

projects = [
	# Dairy and Curd
	{
		title: "Sweet Ricotta Cheese", 
		description: "Ricotta is typically made from whey, the watery byproduct of cheesemaking. But since whey can be difficult to find, you can use a combination of whole milk and cream instead. This ricotta is similar to a queso fresco or paneer.",  
		video: "https://www.youtube.com/watch?v=Usx_0kY6wno",
		difficulty: 2,
		batch_size: 2,
		batch_unit: "cups",
		# kit_id: 
	},
	{
		title: "Handmade Block Tofu", 
		description: "Why make tofu yourself? Because you want to experience it at its peak -- freshly made, creamy, and subtly sweet. Homemade tofu is as precious as homemade bread.",  
		video: "https://www.youtube.com/watch?v=EgdOjyYjjEc",
		difficulty: 4,
		batch_size: 250,
		batch_unit: "grams",
		# kit_id: 	
	},
	{
		title: "Yogurt", 
		description: "Store-bought yogurt may be convenient but it can't compare to the mild creaminess of homemade. The good news is that making yogurt is incredibly easy—as long as you keep your tools clean and don't jiggle the mixture while it's setting, it's almost foolproof. Plus, it's a fun science project for experimenters both young and old.",  
		video: "https://www.youtube.com/watch?v=KoL-lmWzzDs",
		difficulty: 2,
		batch_size: 4,
		batch_unit: "cups",
		# kit_id: 	
	},
	{
		title: "Farmer Cheese", 
		description: "This is an easy home made farmer's cheese. It doesn't age well, so be sure you eat it within a week after it's made - well, if you can let it last that long. If you bake with it, it melts very beautifully. It makes a perfect soft cheese for snacking.",  
		video: "https://www.youtube.com/watch?v=K_gQJu2I1QE",
		difficulty: 3,
		batch_size: 1,
		batch_unit: "pound",
		# kit_id: 	
	},
	{
		title: "Mozzarella Cheese", 
		description: "Knowing how to make your own mozzarella is a dangerous thing. Knowing that at any moment, should the desire present itself, you could whip up your very own ball of creamy mozzarella, still warm from the whey whence it came? Yes. Very very dangerous. Here's how to do it.",  
		video: "https://www.youtube.com/watch?v=1-y9X56ZlUU",
		difficulty: 3,
		batch_size: 1,
		batch_unit: "pound",
		# kit_id: 	
	},
	# Super foods
	{
		title: "Grow Sprouts", 
		description: "Amazingly, half of a cup of most sprouts contains more vitamin C than five glasses of orange juice! To grow your own sprouts, all you need is a mason-type jar, a piece of cheesecloth or other breathable fabric, and the seeds, beans, grains, or nuts you wish to sprout.",  
		video: "https://www.youtube.com/watch?v=OSt0DmAPDm4",
		difficulty: 2,
		batch_size: 1,
		batch_unit: "quart",
		# kit_id: 	
	},
	{
		title: "Nut Milk", 
		description: "Once you make homemade nut milks at home, you'll likely stop buying them at the store. They really are so, so simple and it's nice knowing exactly what's in them and being able to completely control the amount of sweetness on your own. That's the upside.",  
		video: "https://www.youtube.com/watch?v=WeZCMNB2YO0",
		difficulty: 2,
		batch_size: 5,
		batch_unit: "cups",
		# kit_id: 	
	},
	{
		title: "Wheatgrass", 
		description: "Wheatgrass is packed with essential vitamins and nutrients that keep your mind and body healthy and vibrant. Taking a "shot" of juiced wheatgrass as part of your morning breakfast routine is considered a healthy way to start the day, but it can get very expensive. If you want to make wheatgrass a regular part of your diet, try growing it yourself at home instead of buying it already juiced.",  
		video: "https://www.youtube.com/watch?v=Mw57kmVdx5Q",
		difficulty: 2,
		batch_size: 500,
		batch_unit: "grams",
		# kit_id: 	
	},
	# Whole Animal
	{
		title: "Sausage", 
		description: "Making sausage at home is one of those lost arts that really is not so difficult as it sounds. At its core, a sausage is simply ground meat and fat, salt, and flavorings. It really is not much more involved than grinding your own hamburger; you don’t even have to stuff it into links if you don’t want to. Yet the flavor of a well-made link surpasses the sum of its parts, and a truly great sausage is fit to be served as a main course at a fancy dinner.",  
		video: "https://www.youtube.com/watch?v=X36ZlEs9GIU",
		difficulty: 3,
		batch_size: 5,
		batch_unit: "pounds",
		# kit_id: 	
	},
	{
		title: "Bacon", 
		description: "If bacon had it’s own Twitter account it would have more followers than Katy Perry, Justin Bieber, and Barack Obama combined. Everyone loves those slabs of salty goodness. Even those forbidden to eat it have been known to long for it. ",  
		video: "https://www.youtube.com/watch?v=9mxFqfgzonM",
		difficulty: 3,
		batch_size: 1,
		batch_unit: "kilogram",
		# kit_id: 	
	}
]

projects.each do |pro|
	project = Project.where(:title => pro[:title]).first_or_create { |project|
		project.update_attributes(pro)
	}
	unless project.persisted?
		puts "Could not create project #{project.errors.full_messages}"
	end
end

# Seed projects

ingredients = [
	# Dairy and Curd
	[
		{
			name: "Instant-read thermometer",
			type: "equipment",
			shopify_id: 2136960769,
			unit_size: 1,
			# unit_measure: ""
			availability: true 
		},
		{
			name: "Thermometer clip",
			type: "equipment",
			shopify_id: 2135581953,
			unit_size: 1,
			# unit_measure: ""
			availability: true 
		},
		{
			name: "CFH Muslin",
			type: "equipment",
			shopify_id: 2137582657,
			# unit_size: ,
			unit_measure: "sq yd"
			availability: true	
		},
		{
			name: "Colander",
			type: "equipment",
			shopify_id: 3824391809,
			unit_size: 1,
			# unit_measure: ""
			availability: true
		},
		{
			name: "Stainless steel pot",
			type: "equipment",
			shopify_id: nil,
			unit_size: 1,
			# unit_measure: ""
			availability: false
		},
		{
			name: "Citric acid",
			type: "",
			shopify_id: nil,
			unit_size: 0.5,
			unit_measure: "tsp"
			availability: true	
		},
		{
			name: "Milk",
			type: "",
			shopify_id: nil,
			unit_size: 2,
			unit_measure: "L"
			availability: false	
		}
	],
	[
		{
			name: "Nigari Flakes",
			type: "ingredient",
			shopify_id: 4461196737,
			unit_size: 10,
			unit_measure: "grams"
			availability: true	
		},
		{
			name: "8x10 Hemp Bag",
			type: "equipment",
			shopify_id: 2136870465,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		},
		{
			name: "Reblochon Cheese Mold",
			type: "equipment",
			shopify_id: 2134881985,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		},
		{
			name: "Reblochon Follower",
			type: "equipment",
			shopify_id: 2134896641,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		},
		{
			name: "Kitchen Scale",
			type: "equipment",
			shopify_id: 2137938945,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		},
		{
			name: "Dry Soybeans",
			type: "ingredient",
			shopify_id: nil,
			unit_size: 6,
			unit_measure: "oz"
			availability: false	
		},
		{
			name: "Blender",
			type: "equipment",
			shopify_id: nil,
			unit_size: 1,
			unit_measure: ""
			availability: false	
		}
	],
	[
		{
			name: "Milk",
			type: "ingredient",
			shopify_id: nil,
			unit_size: 3.75,
			unit_measure: "cups"
			availability: false	
		},
		{
			name: "Yogourmet",
			type: "ingredient",
			shopify_id: 2135044289,
			unit_size: 5,
			unit_measure: "g"
			availability: true	
		},
		{
			name: "Instant-read thermometer",
			type: "equipment",
			shopify_id: 2136960769,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		},
		{
			name: "Thermometer clip",
			type: "equipment",
			shopify_id: 2135581953,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		},
		{
			name: "2L Yogotherm incubator",
			type: "equipment",
			shopify_id: 3780636545,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		}
	],
	[
		{
			name: "Mesophilic starter",
			type: "ingredient",
			shopify_id: 2137702657,
			unit_size: 0.125,
			unit_measure: "tsp"
			availability: true	
		},
		{
			name: "Rennet tablet",
			type: "ingredient",
			shopify_id: 3523484097,
			unit_size: 0.125,
			unit_measure: ""
			availability: true	
		},
		{
			name: "Calcium Chloride",
			type: "ingredient",
			shopify_id: 2136450625,
			unit_size: 0.125,
			unit_measure: "tsp"
			availability: true	
		},
		{
			name: "CHM Muslin",
			type: "ingredient",
			shopify_id: 2137582657,
			unit_size: 0.25,
			unit_measure: "sq yd"
			availability: true	
		},
		{
			name: "Colander",
			type: "ingredient",
			shopify_id: 3824391809,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		},
		{
			name: "Instant-read thermometer",
			type: "equipment",
			shopify_id: 2136960769,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		},
		{
			name: "Thermometer clip",
			type: "equipment",
			shopify_id: 2135581953,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		},
		{
			name: "Milk",
			type: "ingredient",
			shopify_id: nil,
			unit_size: 2,
			unit_measure: "L"
			availability: false	
		},
		{
			name: "Salt",
			type: "ingredient",
			shopify_id: nil,
			unit_size: 0.5,
			unit_measure: "tsp"
			availability: false	
		},
		{
			name: "Long knife",
			type: "equipment",
			shopify_id: nil,
			unit_size: 1,
			unit_measure: ""
			availability: false	
		},
		{
			name: "Curd skimmer",
			type: "ingredient",
			shopify_id: 2134508417,
			unit_size: 1,
			unit_measure: ""
			availability: true	
		}
	],
	[],
	[],
	[],
	[],
	[]	
]

steps = [
	[
		{
			ordinal: 1,
			content: "Acidify milk with lemon juice, citric acid, or vinegar."
		},
		{
			ordinal: 2,
			content: "Heat milk to 88 degrees celcius."
		},
		{
			ordinal: 3,
			content: "Ladle curds into colander lined with cheesecloth."
		},
		{
			ordinal: 4,
			content: "Hang to drain."
		},
		{
			ordinal: 5,
			content: "Enjoy immediately."
		}
	],
	[
		{
			ordinal: 1,
			content: "Soak soybeans overnight until soft and brittle."
		},
		{
			ordinal: 2,
			content: "Grind beans until smooth."
		},
		{
			ordinal: 3,
			content: "Cook soybean mixture for 3-6 minutes, then strain."
		},
		{
			ordinal: 4,
			content: "Mix nigari (coagulant) with water and pour over milk to separate."
		},
		{
			ordinal: 5,
			content: "Ladle curds into cloth-lined mould and press 10-20 minutes."
		}
	],
	[
		{
			ordinal: 1,
			content: "Heat milk to 85 degrees celcius."
		},
		{
			ordinal: 2,
			content: "Cool milk to 43 degrees celcius."
		},
		{
			ordinal: 3,
			content: "Inoculate milk with yogurt culture or a scoop of 'active' yogurt."
		},
		{
			ordinal: 4,
			content: "Keep warm for 8-12 hours; improvise or use an incubator."
		}
	],
	[
		{
			ordinal: 1,
			content: "Sprinkle mesophilic starter over room temperature milk."
		},
		{
			ordinal: 2,
			content: "Stir in rennet diluted in water."
		},
		{
			ordinal: 3,
			content: "After 8-12 hours, check curd for clean break."
		},
		{
			ordinal: 4,
			content: "Cut curd and ladle into mesh bag or lined colander to drain."
		},
		{
			ordinal: 5,
			content: "Press under weight for a firm-textured cheese."
		}
	],
	[],
	[],
	[],
	[],
	[]
]

projects.each_with_index do |pro, index|
	project = Project.where(title: pro[:title]).first_or_create { |project|
		project.update_attributes(pro)
	}
	ingredients[index].each do |ing|
		ingredient = Ingredient.where(name: ing[:name]).first_or_create { |ingredient|
			ingredient.update_attributes(ing)
			unless ingredient.persisted?
				puts "Could not create ingredient for project #{project.name}: #{ingredient.errors.full_messages}"
			end
		}
	end

	steps[index].each do |st|
		step = Step.create(ordinal: st[:ordinal], content: st[:content])
		unless step.persisted?
			puts "Could not create step for project #{project.name}: #{step.errors.full_messages}"
		end
	end

	unless project.persisted?
		puts "Could not create project #{project.errors.full_messages}"
	end

end