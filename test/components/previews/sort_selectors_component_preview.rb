# frozen_string_literal: true

class SortSelectorsComponentPreview < ViewComponent::Preview
  def default
    render(SortSelectorsComponent.new(model: Work))
  end
end
