# frozen_string_literal: true

class DatePickerComponentPreview < ViewComponent::Preview
  # @param date_attr
  def default(date_attr: :edition_publication)
    work = Work.first
    object_name = :work
    view = ActionView::Base.empty
    form = ActionView::Helpers::FormBuilder.new(object_name, work, view, {})
    render DatePickerComponent.new(form:, date_attr:)
  end
end
