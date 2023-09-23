# frozen_string_literal: true

class ImageEditComponentPreview < ViewComponent::Preview
  def default
    work = Work.first
    object_name = :work
    view = ActionView::Base.empty
    form = ActionView::Helpers::FormBuilder.new(object_name, work, view, {})
    render ImageEditComponent.new(form:, model: work, image_attr: :cover_image,
                                  image_url_attr: :cover_url)
  end
end
