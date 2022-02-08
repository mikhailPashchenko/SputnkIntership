#require 'pry'

module Travel
  class City

    attr_reader :id, :x, :y
    attr_accessor :route_index

    def initialize(id, xy_arr, route_index)
      @id = id
      @x = xy_arr[0].to_i
      @y = xy_arr[1].to_i
      @route_index = route_index
    end

    def to_s
      "id = #{@id}, x = #{@x}, y = #{@y}, route_index = #{@route_index}"
    end

    def distance(other_city)
      (@x - other_city.x).abs + (@y - other_city.y).abs
    end
  end

  class TravelData
    def initialize(filename)
      file = File.open(filename)

      # read cities number from first line
      n = file.readline.chomp.to_i

      # read cities coordinates from next n lines and set index = n + 1
      @all_cities = []
      for i in (1..n) do
        @all_cities.push(City.new(i, file.readline.chomp.split(" "), n + 1))
      end

      # read max distance from next line
      @max_distance = file.readline.chomp.to_i

      #read start city and finish city ids from last line
      start_city_id, finish_city_id = file.readline.chomp.split(" ").map{|c| c.to_i}

      @start_city = @all_cities[start_city_id - 1]
      @finish_city = @all_cities[finish_city_id - 1]

      # set 0 index to start city
      @start_city.route_index = 0

      file.close
    end

    def roads_min_number
      available_cities = [@start_city]
      
      loop do
        temp = available_cities.map { |city| next_cities(city, @all_cities, @max_distance) }
        available_cities = temp.flatten

        if available_cities.include? @finish_city
          return @finish_city.route_index
        elsif available_cities.empty?
          return -1
        end
      end
    end

    private
    def next_cities(current_city, all_cities, max_distance)
      cities = all_cities.select do |city|
        city.route_index > current_city.route_index && current_city.distance(city) <= max_distance
      end

      cities.each { |city| city.route_index = current_city.route_index + 1 < city.route_index ?
        current_city.route_index + 1 : city.route_index }
      cities
    end
  end
end

result = Travel::TravelData.new("input.txt").roads_min_number
File.write("output.txt", result)
