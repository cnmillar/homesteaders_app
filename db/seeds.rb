# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed categories

Category.create(name: "Beekeeping", description: "Supplies for working with honeybees and local pollinators like mason bees and bumblebees!")
Category.create(name: "Dairy & Curd", description: "Supplies for making cheese, yogurt, butter, ice cream, and other dairy or non-dairy curds!")
Category.create(name: "Coffee & Tea", description: "Green coffee, roasting supplies, grinders, and steepers.")
Category.create(name: "Composting", description: "Supplies for working with honeybees and local pollinators like mason bees and bumblebees!")
Category.create(name: "Fermentation", description: "Composting and composters for small spaces.")
Category.create(name: "Fibrecrafts", description: "Yarn, wool, and plant fibres.")
Category.create(name: "Food Storage", description: "Stainless, food-grade plastic, and mylar food storage solutions.")
Category.create(name: "Fungiculture", description: "Stuff for growing mushrooms!")
Category.create(name: "Garden & Permaculture", description: "Supplies for organic gardening and permaculture.")
Category.create(name: "Grains & Baking", description: "Supplies for baking with whole grains - flour mills, proofing baskets, baking pans, sourdough cultures, and more!")
Category.create(name: "Kitchen Basics", description: "Durable goods for your kitchen.")
Category.create(name: "Lifestyle", description: "Products relating to a low-impact, sustainable lifestyle.")
Category.create(name: "Micro-livestock", description: "Supplies for backyard chickens and other small critters!")
Category.create(name: "Preserving", description: "Putting up food, in jars and otherwise!")
Category.create(name: "Soap & Candle", description: "Ingredients for making soaps, lotions, salves, tinctures, candles, cosmetics, and other similar household products.")
Category.create(name: "Superfoods", description: "Supplies for making sprouts, microgreens, wheatgrass juice, nut milk, and other high energy, high nutrient foods!")
Category.create(name: "Water Conservation", description: "Equipment for collecting and conserving water!")
Category.create(name: "Whole Animal", description: "Supplies for making use of the entire animal, from sausage making to curing prime cuts to rendering fat and bone!")

# Seed projects
# Cheese & Dairy Category
# Project.create(title: "Water Kefir", video: )
# Project.create(title: "Kombucha", video: )
# Project.create(title: "Sauerkraut", video: )
# Project.create(title: "Tempeh", video: )
# Project.create(title: "Yogurt", video: )

# Superfoods Category
Project.create(title: "Sprouts", video: "https://www.youtube.com/watch?v=OSt0DmAPDm4")
Project.create(title: "Wheatgrass", video: "https://www.youtube.com/watch?v=Mw57kmVdx5Q")
Project.create(title: "Nut Milk", video: "https://www.youtube.com/watch?v=WeZCMNB2YO0")

# Whole Animal Category
Project.create(title: "Sausage", video: "https://www.youtube.com/watch?v=X36ZlEs9GIU")
Project.create(title: "Bacon", video: "https://www.youtube.com/watch?v=9mxFqfgzonM")