class IsNotFutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value <= Time.now
      record.errors.add attribute, (options[:message] || 'must not be in the future')
    end
  end
end
