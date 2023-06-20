module DateValidators
  class IsNotFutureValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if value <= Time.now

      record.errors.add attribute, (options[:message] || 'must not be in the future')
    end
  end

  # Equivalent to comparison operator, but checks for nil value first
  class IsBeforeValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      debugger
      return if options[:value].blank? || value <= options[:value]

      record.errors.add attribute, (options[:message] || "must be before #{options[:value]}")
    end
  end

  # Equivalent to comparison operator, but checks for nil value first
  class IsAfterValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if options[:value].blank? || value >= options[:value]

      record.errors.add attribute, (options[:message] || "must be after #{options[:value]}")
    end
  end
end
