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
end