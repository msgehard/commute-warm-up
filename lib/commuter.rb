class Commuter
  def group_by_name(data)
    value = {}
    data.each do |row|
      name = row[0]
      previous_trips = value.fetch(name) { [] }
      trip = {
          week: row[1],
          day: row[2],
          mode: row[3],
          inbound: row[4],
          outbound: row[5],
          distance: row[6]
      }
      updated_trips = previous_trips << trip
      value[name] = updated_trips.sort do |a, b|
        weeks_identical = (a[:week] <=> b[:week]) == 0

        if weeks_identical
          day_number(a[:day]) <=> day_number(b[:day])
        end
      end
    end
    value
  end

  private
  def day_number(day_string)
    DateTime.parse(day_string).wday
  end
end