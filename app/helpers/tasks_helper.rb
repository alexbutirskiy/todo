module TasksHelper
  def date_time_convert(datetime)
    return nil if datetime.nil?
    return datetime.to_date.to_s if datetime.hour == 0 && datetime.min == 0
    datetime.to_s
  end
end
