require 'open-uri'
require 'json'

divvy_data = open("http://www.divvybikes.com/stations/json").read()
divvy_json = JSON.parse(divvy_data)


address = "1520 W. Jackson Blvd, Chicago IL 60607"  #put whatever address you like in the quotes to find the closest Divvy stations to your location\
address = address.chomp.gsub(" ","+")

json_geo = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read()
data_geo = JSON.parse(json_geo)

latitude = data_geo["results"][0]["geometry"]["location"]["lat"]
longitude = data_geo["results"][0]["geometry"]["location"]["lng"]

closest_station = open("http://shrouded-beach-2183.herokuapp.com/stations/nearby?lat=#{latitude}&lon=#{longitude}").read()
closest = JSON.parse(closest_station)

#puts JSON.pretty_generate(closest)

closest.each do |close|
	id = close["properties"]["id"].to_i
	divvy_json["stationBeanList"].each do |station|
		if station["id"].to_i == id
			puts "#{station["stationName"]} has #{station["availableBikes"]} available"
		end
	end
end