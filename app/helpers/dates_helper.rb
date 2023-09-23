module DatesHelper
  def date_string_safe(date)
    if date&.is_a?(Date)
      date.strftime('%m/%d/%Y')
    else
      'N/A'
    end
  end
end
