load "SoccerLeagueTable.rb"
load "WeatherData.rb"

puts "Minimum spread teams."

soccer_league = SoccerLeagueTable.new file_name: "football.dat"

soccer_league.minimum_difference.each do |team|
  puts team.to_s
end

soccer_league.update

soccer_league.minimum_difference.each do |team|
  puts team.to_s
end

puts "\nMinimum spread days."

weather_info = WeatherData.new file_name: "weather.dat"

weather_info.minimum_difference.each do |day|
  puts day.to_s
end

weather_info.update

weather_info.minimum_difference.each do |day|
  puts day.to_s
end
