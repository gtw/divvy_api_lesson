require 'open-uri'
require 'json'

divvy_data = open("http://www.divvybikes.com/stations/json").read()
divvy_json = JSON.parse(divvy_data)

# So let's look at what we've downloaded. For the sake of making everything run smoothly let's just uncomment everything one line at a time

# puts divvy_json

# Alright! We've successfully taken the data down from the web, but it looks something awful.  Let's make it prettier

# puts JSON.pretty_generate(divvy_json)

# In fact, the command literally says what it is we're doing, we're making the JSON file prettier to read.
# This file is a lot easier to look through in this format.  For example, we can tell that the structure contains many large "chunks"
# that contain information about a single station. Perhaps we can do something useful with that information, but first we need a way to grab it

# I'll get you guys started and then give you a minute or two to mess around with it yourself.  For starters, here I'm grabbing the execution time

# puts divvy_json["executionTime"]

# and here I'm grabbing the first station in the list

# puts JSON.pretty_generate(divvy_json["stationBeanList"][0])

# Take a minute and see if you can print just the name of the second station in the list

# I'd encourage you to explore the JSON for a minute. Do you know what all the variables mean?  Can we do anything interesting with them?

# Something we might want to try is printing all stations that meet a certain criteria.  For example, can we print all stations that with exactly 39 totalDocks?

# divvy_json["stationBeanList"].each do |station|
# 	if # what needs to go here?
# 		puts # what needs to go here?
# 	end
# end 

# Coolness, but 39 seems pretty arbitrary.  So let's see if we can find the largest and smallest stations in the system.