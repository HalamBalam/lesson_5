require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations

  @instances = 0

  def initialize(start, finish)
    @stations = [start, finish]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def delete_station(station)
    return if [@stations.first, @stations.last].include?(station)
    @stations.delete(station)
  end

  def print
    stations.each { |station| puts station.name }
  end

  def description
    start = stations.first.name
    finish = stations.last.name
    "#{start}-#{finish}, станций: #{stations.size}"
  end

end
