# frozen_string_literal: true

class DatePickerComponent < ViewComponent::Base
  def initialize(form:, date_attr:)
    @form = form
    @object = @form.object

    if date_attr.is_a?(Symbol) && @form.object.respond_to?(date_attr)
      @date_attr = date_attr
    else
      raise Exception.new 'Invalid date_attr passed to DatePickerComponent'
    end
  end

  def era_options
    return unless @object.respond_to?(era_attr)

    selected = (@object[era_attr].present? ? @object[era_attr] : 'AD' )

    options_for_select(["BC", "AD"], selected)
  end

  def era_attr
    "#{@date_attr}_era".to_sym
  end

  def year_attr
    "#{@date_attr}_year".to_sym
  end

  def month_attr
    "#{@date_attr}_month".to_sym
  end

  def day_attr
    "#{@date_attr}_day".to_sym
  end
end
