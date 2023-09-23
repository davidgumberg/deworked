# frozen_string_literal: true

class DatePickerComponentPreview < ViewComponent::Preview
  def default
    render(DatePickerComponent.new(form: "form", date_attr: "date_attr"))
  end
end
