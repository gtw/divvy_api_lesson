# a script for determining the station with the largest capacity in the entire Divvy system
# remember, if you're ever wondering what the JSON file looks like you should use JSON.generate_pretty(your_json_file_name_here) to check it out

# we require the necessary libraries to download the data and turn the json into a usable ruby data structure
require 'open-uri'
require 'json'

# this is where we actually download the json and turn it into a ruby data structure
divvy_data = open("http://www.divvybikes.com/stations/json").read()
divvy_json = JSON.parse(divvy_data)

max_size = 0
max_location = ""
divvy_json["stationBeanList"].each do |station|
	if station["totalDocks"].to_i > max_size
		max_size = station["totalDocks"].to_i
		max_location = station["location"]
	end
end

puts "The largest station in the system can accommodate #{max_size} bikes and is located at #{max_location}"

# See if you can alter the code above to give me the smallest station in the system.  How many bikes can it accommodate?
# for starters I suggest just copying everything starting at line 11 down below this code


# I've created the output line for you already, see if you can create the code needed to feed into it
puts "The smallest station in the system can accommodate #{min_size} bikes and is located at #{min_location}"