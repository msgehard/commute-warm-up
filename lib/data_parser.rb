class DataParser
  def parse(data)
    result = {}
    data.each do |row|
      existing_data = result.fetch(row[0]) { [] }
      new_data = {
          week: row[1],
          day: row[2],
          mode: row[3],
          inbound: row[4],
          outbound: row[5],
          distance: row[6]
      }
      result[row[0]] = (existing_data << new_data).sort do |a, b|
        week_same = compare_by_week(a, b).zero?
        if week_same
          compare_by_day(a, b)
        else
          compare_by_week(a, b)
        end
      end
    end
    result
  end

  def compare_by_week(a, b)
    a[:week] <=> b[:week]
  end

  private

  def compare_by_day(a, b)
    day_number(a[:day]) <=> day_number(b[:day])
  end

  def day_number(day)
    case day
      when "Monday"
        1
      when "Tuesday"
        2
      when "Wednesday"
        3
      when "Thursday"
        4
      when "Friday"
        5
    end
  end
end