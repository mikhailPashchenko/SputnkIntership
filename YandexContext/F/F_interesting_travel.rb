require 'pry'

module Roads
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

  def next_cities(current_city, all_cities, max_distanse)
    cities = all_cities.select do |city|
      city.route_index > current_city.route_index && current_city.distance(city) <= max_distanse
    end

    cities.each { |city| city.route_index= [current_city.route_index + 1, city.route_index].min }
    cities
  end


  def roads_min_number(filename)
    file = File.open(filename)
    n = file.readline.chomp.to_i
    cities = []
    for i in (1..n) do
      cities.append(City.new(i, file.readline.chomp.split(" "), n + 1))
    end

    k = file.readline.chomp.to_i
    start_city_id, finish_city_id = file.readline.chomp.split(" ").map{|c| c.to_i}
    start_city = cities[start_city_id - 1]
    start_city.route_index = 0
    cities[start_city_id - 1] = start_city
    finish_city = cities[finish_city_id - 1]
    file.close

    puts "n = #{n}"
    puts "max distance = #{k}"
    cities.each { |c| puts c }
    puts "start:  #{start_city.to_s }"
    puts "finish: #{finish_city.to_s }"

    available_cities = [start_city]
    loop do
      temp = available_cities.map do |city|
        t = next_cities(city, cities, k)
        #binding.pry
      end
      available_cities = temp.flatten
      #binding.pry
      if (finish_city = available_cities.find { |city| city.id == finish_city_id }) || available_cities.empty?
        #binding.pry
        break
      end
    end

    result = 
      if finish_city
        finish_city.route_index
      else
        -1
      end
    File.write("output.txt", result)
  end
end
