class Reporter
  def initialize(data)
    @data = data
  end

  def inbound_commute_time(name, week, day)
    person_data = @data[name]

    data_for_day_and_week = person_data.find do |commute_data|
      commute_data[:week] == week && commute_data[:day] == day
    end

    data_for_day_and_week[:inbound]
  end

  def average_commute_time
    all_data = @data.map {|name, data| data}.flatten

    total_commute_time = all_data.inject(0) {|sum, data| sum + data[:inbound] + data[:outbound]}

    total_data_points = (all_data.length * 2)

    total_commute_time / total_data_points
  end

  def fastest_walker
    max_speed = 0
    fastest_person = ""

    @data.each do |name, trips|
      trips.each do |trip|
        average_speed = (trip[:distance] * 2) / (trip[:inbound] + trip[:outbound])
        if average_speed > max_speed
          max_speed = average_speed
          fastest_person = name
        end
      end
    end
    [fastest_person, max_speed]
  end
end