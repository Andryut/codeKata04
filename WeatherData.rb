load "TableFile.rb"

class WeatherData < TableFile
  def update
    super
    unless @data.nil?
      @days = Array.new
      @data.each do |element|
        unless element[0].to_i == 0
          @days << DayWeather.new(day: element[0].to_i, maxTemperature: element[1].to_i, minTemperature: element[2].to_i)
        end
      end
    end
  end

  def to_s
    out = ""
    @days.each do |day|
      out += day.to_s + "\n"
    end
    out
  end

  def minimumSpreadDay
    unless @days.nil?
      minSpreadDay = Array.new
      minSpreadDay << @days[0]
      iteration = 0
      @days.each do |day|
        if minSpreadDay[0].temperatureSpread > day.temperatureSpread
          minSpreadDay.clear
          minSpreadDay << day
        elsif minSpreadDay[0].temperatureSpread == day.temperatureSpread
          minSpreadDay << day
        end
        if iteration == 0
          minSpreadDay.pop
          iteration += 1
        end
      end
      minSpreadDay
    end
  end
end

class DayWeather
  def initialize day:, maxTemperature:, minTemperature:
    @day = day
    @maxTemperature = maxTemperature
    @minTemperature = minTemperature
  end

  def temperatureSpread
    (@maxTemperature - @minTemperature).abs
  end

  def to_s
    '[' + @day.to_s + ', ' + @maxTemperature.to_s + ', ' + @minTemperature.to_s + ']'
  end
end
