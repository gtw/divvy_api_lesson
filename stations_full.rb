require 'open-uri'
require 'json'

divvy_data = open("http://www.divvybikes.com/stations/json").read()
divvy_json = JSON.parse(divvy_data)

empty_count = 0
quarter_full_count = 0
half_full_count = 0
three_quarters_full_count = 0
nearly_full_count = 0
full_count = 0

divvy_json["stationBeanList"].each do |station|
	if station["availableBikes"].to_i == 0
		empty_count = empty_count + 1
	elsif station["availableBikes"].to_i < station["totalDocks"] / 4.0
		quarter_full_count = quarter_full_count + 1
	elsif station["availableBikes"].to_i < station["totalDocks"] / 2.0
		half_full_count = half_full_count + 1
	elsif station["availableBikes"].to_i < station["totalDocks"] * 3/4.0 
		three_quarters_full_count = three_quarters_full_count + 1
	elsif station["availableBikes"].to_i < station["totalDocks"]
		nearly_full_count = nearly_full_count + 1
	else
		full_count = full_count + 1
	end
end

puts "There are #{empty_count} stations that are empty"
puts "There are #{quarter_full_count} stations that are not even a quarter full"
puts "There are #{half_full_count} stations that are between a quarter and half full"
puts "There are #{three_quarters_full_count} stations that are between a half and three quarters full"
puts "There are #{nearly_full_count} stations that are nearly full"
puts "There are #{full_count} stations that are entirely full"