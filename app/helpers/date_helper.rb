module DateHelper

  def date_string_safe(date)
    if date&.is_a?(Date)
      date.strftime('%m/%d/%Y')
    else
      'N/A'
    end
  end

  def date_unsplitter(value)
    if value.is_a? Date 
      return value
    elsif value.is_a?(HashWithIndifferentAccess)
      hash = value.transform_values(&:to_i)
      return Date.new(hash.dig(:year), hash.fetch(:month, 1), hash.fetch(:day, 1))
    end
  end

end
