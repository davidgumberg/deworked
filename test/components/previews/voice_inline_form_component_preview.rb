# frozen_string_literal: true

class VoiceInlineFormComponentPreview < ViewComponent::Preview
  def default
    render(VoiceInlineFormComponent.new(form: "form", voice: "voice"))
  end
end
