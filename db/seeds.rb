# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

##### Seed categories

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

##### Seed projects

projects = [
	# Dairy and Curd
	{
		title: "Make Sweet Ricotta Cheese", 
		description: "Ricotta is typically made from whey, the watery byproduct of cheesemaking. But since whey can be difficult to find, you can use a combination of whole milk and cream instead. This ricotta is similar to a queso fresco or paneer.",
		category_id: 2,  
		difficulty: 2,
		batch_size: 2,
		batch_unit: "cups",
		duration: 12,
		duration_unit: "hours"
		# kit_id: 
	},
	{
		title: "Make Handmade Block Tofu", 
		description: "Why make tofu yourself? Because you want to experience it at its peak -- freshly made, creamy, and subtly sweet. Homemade tofu is as precious as homemade bread.", 
		category_id: 2,  
		difficulty: 4,
		batch_size: 250,
		batch_unit: "grams",
		duration: 2,
		duration_unit: "hours"
		# kit_id: 	
	},
	{
		title: "Make Yogurt", 
		description: "Store-bought yogurt may be convenient but it can't compare to the mild creaminess of homemade. The good news is that making yogurt is incredibly easy—as long as you keep your tools clean and don't jiggle the mixture while it's setting, it's almost foolproof. Plus, it's a fun science project for experimenters both young and old.", 
		category_id: 2,  
		difficulty: 2,
		batch_size: 4,
		batch_unit: "cups",
		duration: 5,
		duration_unit: "hours"
		# kit_id: 	
	},
	{
		title: "Make Farmer Cheese", 
		description: "This is an easy home made farmer's cheese. It doesn't age well, so be sure you eat it within a week after it's made - well, if you can let it last that long. If you bake with it, it melts very beautifully. It makes a perfect soft cheese for snacking.",
		category_id: 2,   
		difficulty: 3,
		batch_size: 1,
		batch_unit: "pound",
		duration: 5,
		duration_unit: "hours",
		kit_id: 3514926913	
	},
	{
		title: "Make Mozzarella Cheese", 
		description: "Knowing how to make your own mozzarella is a dangerous thing. Knowing that at any moment, should the desire present itself, you could whip up your very own ball of creamy mozzarella, still warm from the whey whence it came? Yes. Very very dangerous. Here's how to do it.",
		category_id: 2,   
		difficulty: 3,
		batch_size: 1,
		batch_unit: "pound",
		duration: 2,
		duration_unit: "hours"
		# kit_id: 	
	},
	# Super foods
	{
		title: "Grow Sprouts", 
		description: "Amazingly, half of a cup of most sprouts contains more vitamin C than five glasses of orange juice! To grow your own sprouts, all you need is a mason-type jar, a piece of cheesecloth or other breathable fabric, and the seeds, beans, grains, or nuts you wish to sprout.", 
		category_id: 14,  
		difficulty: 2,
		batch_size: 1,
		batch_unit: "quart",
		duration: 30,
		duration_unit: "minutes",
		kit_id: 3514925441	
	},
	{
		title: "Make Nut Milk", 
		description: "Once you make homemade nut milks at home, you'll likely stop buying them at the store. They really are so, so simple and it's nice knowing exactly what's in them and being able to completely control the amount of sweetness on your own. That's the upside.", 
		category_id: 14, 
		difficulty: 2,
		batch_size: 5,
		batch_unit: "cups",
		duration: 30,
		duration_unit: "minutes"
		# kit_id: 	
	},
	{
		title: "Grow Wheatgrass", 
		description: "Wheatgrass is packed with essential vitamins and nutrients that keep your mind and body healthy and vibrant. Taking a 'shot' of juiced wheatgrass as part of your morning breakfast routine is considered a healthy way to start the day, but it can get very expensive. If you want to make wheatgrass a regular part of your diet, try growing it yourself at home instead of buying it already juiced.", 
		category_id: 14, 
		difficulty: 2,
		batch_size: 500,
		batch_unit: "grams",
		duration: 30,
		duration_unit: "minutes"
		# kit_id: 	
	},
	# Whole Animal
	{
		title: "Make Sausage", 
		description: "Making sausage at home is one of those lost arts that really is not so difficult as it sounds. At its core, a sausage is simply ground meat and fat, salt, and flavorings. It really is not much more involved than grinding your own hamburger; you don’t even have to stuff it into links if you don’t want to. Yet the flavor of a well-made link surpasses the sum of its parts, and a truly great sausage is fit to be served as a main course at a fancy dinner.",  
		category_id: 16,
		difficulty: 3,
		batch_size: 5,
		batch_unit: "pounds",
		duration: 3,
		duration_unit: "hours"
		# kit_id: 	
	},
	{
		title: "Make Bacon", 
		description: "If bacon had it’s own Twitter account it would have more followers than Katy Perry, Justin Bieber, and Barack Obama combined. Everyone loves those slabs of salty goodness. Even those forbidden to eat it have been known to long for it. ",  
		category_id: 16,
		difficulty: 3,
		batch_size: 1,
		batch_unit: "kg",
		duration: 1,
		duration_unit: "hour",
		kit_id: 2135948673	
	}
]

# Seed projects

ingredients = [
	# Dairy and Curd
	[
		{
			name: "Instant-read thermometer",
			ing_type: "equipment",
			shopify_id: 2136960769,
			unit_size: 1,
			# unit_measure: "",
			shopify_unit: 1,
			availability: true 
		},
		{
			name: "Thermometer clip",
			ing_type: "equipment",
			shopify_id: 2135581953,
			unit_size: 1,
			shopify_unit: 1,
			# unit_measure: ""
			availability: true 
		},
		{
			name: "CFH Muslin",
			ing_type: "equipment",
			shopify_id: 2137582657,
			unit_size: 1,
			unit_measure: "sq yd",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "Colander",
			ing_type: "equipment",
			shopify_id: 3824391809,
			unit_size: 1,
			shopify_unit: 1,
			# unit_measure: ""
			availability: true
		},
		{
			name: "Stainless steel pot",
			ing_type: "equipment",
			shopify_id: nil,
			unit_size: 1,
			# unit_measure: ""
			availability: false
		},
		{
			name: "Citric acid",
			ing_type: "ingredient",
			shopify_id: nil,
			unit_size: 0.5,
			unit_measure: "tsp",
			availability: false	
		},
		{
			name: "Milk",
			ing_type: "ingredient",
			shopify_id: nil,
			unit_size: 2,
			unit_measure: "L",
			availability: false	
		}
	],
	[
		{
			name: "Nigari Flakes",
			ing_type: "ingredient",
			shopify_id: 4461196737,
			unit_size: 10,
			unit_measure: "grams",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "8x10 Hemp Bag",
			ing_type: "equipment",
			shopify_id: 2136870465,
			unit_size: 1,
			shopify_unit: 1,
			unit_measure: "",
			availability: true	
		},
		{
			name: "Reblochon Cheese Mold",
			ing_type: "equipment",
			shopify_id: 2134881985,
			unit_size: 1,
			shopify_unit: 1,
			unit_measure: "",
			availability: true	
		},
		{
			name: "Reblochon Follower",
			ing_type: "equipment",
			shopify_id: 2134896641,
			unit_size: 1,
			shopify_unit: 1,
			unit_measure: "",
			availability: true	
		},
		{
			name: "Kitchen Scale",
			ing_type: "equipment",
			shopify_id: 2137938945,
			unit_size: 1,
			shopify_unit: 1,
			unit_measure: "",
			availability: true	
		},
		{
			name: "Dry Soybeans",
			ing_type: "ingredient",
			shopify_id: nil,
			unit_size: 6,
			unit_measure: "oz",
			availability: false	
		},
		{
			name: "Blender",
			ing_type: "equipment",
			shopify_id: nil,
			unit_size: 1,
			unit_measure: "",
			availability: false	
		}
	],
	[
		{
			name: "Milk",
			ing_type: "ingredient",
			shopify_id: nil,
			unit_size: 3.75,
			unit_measure: "cups",
			availability: false	
		},
		{
			name: "Yogourmet",
			ing_type: "ingredient",
			shopify_id: 2135044289,
			unit_size: 5,
			unit_measure: "g",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "Instant-read thermometer",
			ing_type: "equipment",
			shopify_id: 2136960769,
			unit_size: 1,
			unit_measure: "",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "Thermometer clip",
			ing_type: "equipment",
			shopify_id: 2135581953,
			unit_size: 1,
			unit_measure: "",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "2L Yogotherm incubator",
			ing_type: "equipment",
			shopify_id: 3780636545,
			unit_size: 1,
			unit_measure: "",
			shopify_unit: 1,
			availability: true	
		}
	],
	[
		{
			name: "Mesophilic starter",
			ing_type: "ingredient",
			shopify_id: 2137702657,
			unit_size: 0.125,
			unit_measure: "tsp",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "Rennet tablet",
			ing_type: "ingredient",
			shopify_id: 3523484097,
			unit_size: 0.125,
			unit_measure: "",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "Calcium Chloride",
			ing_type: "ingredient",
			shopify_id: 2136450625,
			unit_size: 0.125,
			unit_measure: "tsp",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "CHM Muslin",
			ing_type: "ingredient",
			shopify_id: 2137582657,
			unit_size: 0.25,
			unit_measure: "sq yd",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "Colander",
			ing_type: "ingredient",
			shopify_id: 3824391809,
			unit_size: 1,
			unit_measure: "",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "Instant-read thermometer",
			ing_type: "equipment",
			shopify_id: 2136960769,
			unit_size: 1,
			unit_measure: "",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "Thermometer clip",
			ing_type: "equipment",
			shopify_id: 2135581953,
			unit_size: 1,
			unit_measure: "",
			shopify_unit: 1,
			availability: true	
		},
		{
			name: "Milk",
			ing_type: "ingredient",
			shopify_id: nil,
			unit_size: 2,
			unit_measure: "L",
			availability: false	
		},
		{
			name: "Salt",
			ing_type: "ingredient",
			shopify_id: nil,
			unit_size: 0.5,
			unit_measure: "tsp",
			availability: false	
		},
		{
			name: "Long knife",
			ing_type: "equipment",
			shopify_id: nil,
			unit_size: 1,
			unit_measure: "",
			availability: false	
		},
		{
			name: "Curd skimmer",
			ing_type: "ingredient",
			shopify_id: 2134508417,
			unit_size: 1,
			unit_measure: "",
			shopify_unit: 1,
			availability: true	
		}
	]
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
	]
]

projects.each_with_index do |pro, index|
	project = Project.where(title: pro[:title]).first_or_create { |project|
		project.update_attributes(pro)
	}

	unless project.persisted?
		puts "Could not create project: #{project.errors.full_messages}"
	end

	if ingredients[index]
		ingredients[index].each do |ing|
			ingredient = Ingredient.where(name: ing[:name]).first_or_create { |ingredient|
				ingredient.update_attributes(name: ing[:name], ing_type: ing[:ing_type], shopify_id: ing[:shopify_id], unit_size: ing[:unit_size], unit_measure: ing[:unit_measure], availability: ing[:availability], project_id: project.id, shopify_unit: ing[:shopify_unit])
				unless ingredient.persisted?
					puts "Could not create ingredient for project #{project.name}: #{ingredient.errors.full_messages}"
				end
			}
		end
	end

	if steps[index]
		steps[index].each do |st|
			step = Step.create(ordinal: st[:ordinal], content: st[:content], project_id: project.id)
			unless step.persisted?
				puts "Could not create step for project #{project.name}: #{step.errors.full_messages}"
			end
		end
	end

end

##### Seed videos

videos = 
[
	{
		title: "Making ricotta cheese",
		url:  "https://www.youtube.com/embed/Usx_0kY6wno",
		duration: 155,
		project_id: 1 
	},
	{
		title: "Making tofu",
		url: "https://www.youtube.com/embed/EgdOjyYjjEc",
		duration: 155,
		project_id: 2
	},
	{
		url: "https://www.youtube.com/embed/KoL-lmWzzDs",
		title: "Making yogurt",
		duration: 155,
		project_id: 3
	},
	{
		title: "Farmer Cheese", 
		url: "https://www.youtube.com/embed/K_gQJu2I1QE",
		duration: 155,
		project_id: 4
	},
	{
		title: "Mozzarella Cheese", 
		url: "https://www.youtube.com/embed/1-y9X56ZlUU",
		duration: 155,
		project_id: 5
	},
	{
		title: "Grow Sprouts", 
		url: "https://www.youtube.com/embed/OSt0DmAPDm4",
		duration: 155,
		project_id: 6		

	},
	{
		title: "Nut Milk", 
		url: "https://www.youtube.com/embed/WeZCMNB2YO0",
		duration: 155,
		project_id: 7
	},
	{
		title: "Wheatgrass", 
		url: "https://www.youtube.com/embed/Mw57kmVdx5Q",
		duration: 155,
		project_id: 8
	},
	{
		title: "Sausage", 
		url: "https://www.youtube.com/embed/X36ZlEs9GIU",
		duration: 155,
		project_id: 9		
	},
	{
		title: "Bacon", 
		url: "https://www.youtube.com/embed/9mxFqfgzonM",
		duration: 155,
		project_id: 10
	}
]		
videos.each_with_index do |v|
	video = Video.create(title: v[:title], url: v[:url], duration: v[:duration], project_id: v[:project_id])
	unless video.persisted?
		puts "Could not create video: #{v.errors.full_messages}"
	end
end


##### Seed comments

comments_on_video = 
[
	{
		content: "Wow, loved this!",
		commentable_type: "Video",
		commentable_id: 1,
		video_time: 50
	},
	{
		content: "I would add more salt here!",
		commentable_type: "Video",
		commentable_id: 3,
		video_time: 50
	},
	{
		content: "You can also use vinegar instead of lemon juice.",
		commentable_type: "Video",
		commentable_id: 8,
		video_time: 100
	}
]

comments_on_video.each do |com|
	comment = Comment.create(content: com[:content], commentable_id: com[:commentable_id], commentable_type: com[:commentable_type], video_time: com[:video_time])
	unless comment.persisted?
		puts "Could not create comment: #{comment.errors.full_messages}"
	end
end

comments_on_project = 
[
	{
		content: "Wow, loved this!",
		commentable_type: "Project",
		commentable_id: 1,
	},
	{
		content: "I would add more salt to the recipe!",
		commentable_type: "Project",
		commentable_id: 3,
		video_time: 50
	},
	{
		content: "Anybody tried this with vinegar?",
		commentable_type: "Project",
		commentable_id: 8,
	}
]

comments_on_project.each do |com|
	comment = Comment.create(content: com[:content], commentable_id: com[:commentable_id], commentable_type: com[:commentable_type], video_time: com[:video_time])
	unless comment.persisted?
		puts "Could not create comment: #{comment.errors.full_messages}"
	end
end


comments_on_ingredient = 
[
	{
		content: "Wow, good idea!",
		commentable_type: "Ingredient",
		commentable_id: 1,
	},
	{
		content: "Add a bit extra of this ingredient.",
		commentable_type: "Ingredient",
		commentable_id: 3,
	},
	{
		content: "You can also use vinegar instead of lemon juice.",
		commentable_type: "Ingredient",
		commentable_id: 20,
	}
]

comments_on_ingredient.each do |com|
	comment = Comment.create(content: com[:content], commentable_id: com[:commentable_id], commentable_type: com[:commentable_type], video_time: com[:video_time])
	unless comment.persisted?
		puts "Could not create comment: #{comment.errors.full_messages}"
	end
end

comments_on_step = 
[
	{
		content: "Wow, good idea!",
		commentable_type: "Step",
		commentable_id: 5,
	},
	{
		content: "I find that a Vitamix works best.",
		commentable_type: "Step",
		commentable_id: 10,
	},
	{
		content: "This is the best part!",
		commentable_type: "Step",
		commentable_id: 15,
	}
]

comments_on_step.each do |com|
	comment = Comment.create(content: com[:content], commentable_id: com[:commentable_id], commentable_type: com[:commentable_type], video_time: com[:video_time])
	unless comment.persisted?
		puts "Could not create comment: #{comment.errors.full_messages}"
	end
end


#### Seed users

users = [
	{
		admin: true,
		email: "cnmillar@gmail.com",
		avatar: "http://www.sunnyskyz.com/images/webpics/2012-11/98fl3-happy-face.jpg",
		first_name: "Caitlin",
		last_name: "Millar",
		facebook_id: 123456789
	},
	{
		admin: true,
		email: "test@test.ca",
		avatar: "http://www.sunnyskyz.com/images/webpics/2012-11/98fl3-happy-face.jpg",
		first_name: "David",
		last_name: "Good",
		facebook_id: 223456789
	},
	{
		admin: true,
		email: "beth@test.ca",
		avatar: "http://www.sunnyskyz.com/images/webpics/2012-11/98fl3-happy-face.jpg",
		first_name: "Beth",
		last_name: "Hammett",
		facebook_id: 223456799
	},
	{
		admin: false,
		email: "sam@smith.ca",
		avatar: "http://www.sunnyskyz.com/images/webpics/2012-11/98fl3-happy-face.jpg",
		first_name: "Sam",
		last_name: "Smith",
		facebook_id: 11335544
	}
]

users.each do |u|
	user = User.create!(admin: u[:admin], email: u[:email], avatar: u[:avatar], first_name: u[:first_name], last_name: u[:last_name], facebook_id: u[:facebook_id])
	unless user.persisted?
		puts "Could not create user: #{u.errors.full_messages}"
	end
end

images = [
	{
		user_id: 1,
		project_id: 1,
		original: 'project_gallery/ricotta-1.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 1,
		original: 'project_gallery/ricotta-2.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 2,
		original: 'project_gallery/tofu-1.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 2,
		original: 'project_gallery/tofu-2.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 2,
		original: 'project_gallery/tofu-3.jpg'
		# resized_image:
		# description:
	},
		{
		user_id: 1,
		project_id: 4,
		original: 'project_gallery/farmer-cheese-1.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 4,
		original: 'project_gallery/farmer-cheese-2.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 4,
		original: 'project_gallery/farmer-cheese-3.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 4,
		original: 'project_gallery/farmer-cheese-4.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 5,
		original: 'project_gallery/mozzarella-1.jpg'
		# resized_image:
		# description:
	},
		{
		user_id: 1,
		project_id: 5,
		original: 'project_gallery/mozzarella-2.jpg'
		# resized_image:
		# description:
	},
		{
		user_id: 1,
		project_id: 5,
		original: 'project_gallery/mozzarella-3.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 5,
		original: 'project_gallery/mozzarella-4.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 5,
		original: 'project_gallery/mozzarella-5.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 6,
		original: 'project_gallery/sprouts-1.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 6,
		original: 'project_gallery/sprouts-2.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 6,
		original: 'project_gallery/sprouts-3.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 8,
		original: 'project_gallery/wheatgrass-1.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 8,
		original: 'project_gallery/wheatgrass-2.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 8,
		original: 'project_gallery/wheatgrass-3.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 8,
		original: 'project_gallery/wheatgrass-4.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 8,
		original: 'project_gallery/wheatgrass-5.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 8,
		original: 'project_gallery/wheatgrass-6.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 8,
		original: 'project_gallery/wheatgrass-7.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 9,
		original: 'project_gallery/sausage-1.jpg'
		# resized_image:
		# description:
	},
		{
		user_id: 1,
		project_id: 9,
		original: 'project_gallery/sausage-2.jpg'
		# resized_image:
		# description:
	},
		{
		user_id: 1,
		project_id: 9,
		original: 'project_gallery/sausage-3.jpg'
		# resized_image:
		# description:
	},
		{
		user_id: 1,
		project_id: 9,
		original: 'project_gallery/sausage-4.jpg'
		# resized_image:
		# description:
	},
	{
		user_id: 1,
		project_id: 10,
		original: 'project_gallery/bacon-1.jpg'
		# resized_image:
		# description:
	},
		{
		user_id: 1,
		project_id: 10,
		original: 'project_gallery/bacon-2.jpg'
		# resized_image:
		# description:
	},
		{
		user_id: 1,
		project_id: 10,
		original: 'project_gallery/bacon-3.jpg'
		# resized_image:
		# description:
	},
		{
		user_id: 1,
		project_id: 10,
		original: 'project_gallery/bacon-4.jpg'
		# resized_image:
		# description:
	},
		{
		user_id: 1,
		project_id: 10,
		original: 'project_gallery/bacon-5.jpg'
		# resized_image:
		# description:
	}


]

images.each do |img|
	image = Image.create(user_id: img[:user_id], project_id: img[:project_id], original: img[:original])
	unless image.persisted?
		puts "Could not add image: #{img.errors.full_messages}"
	end
end
