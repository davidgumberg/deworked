# frozen_string_literal: true

class WorkCoverFormComponentPreview < ViewComponent::Preview
  def default
    work = Work.first
    object_name = :work
    view = ActionView::Base.empty
    form = ActionView::Helpers::FormBuilder.new(object_name, work, view, {})
    render WorkCoverFormComponent.new(work:, form:)
  end
end
