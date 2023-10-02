# frozen_string_literal: true

class ExternalWorkFormComponentPreview < ViewComponent::Preview
  def default
    render(ExternalWorkFormComponent.new)
  end
end
