# frozen_string_literal: true

class AuthorInlineFormComponentPreview < ViewComponent::Preview
  def default
    author = Author.first
    object_name = :author
    view = ActionView::Base.empty
    form = ActionView::Helpers::FormBuilder.new(object_name, author, view, {})
    render AuthorInlineFormComponent.new(form:, author:)
  end
end
