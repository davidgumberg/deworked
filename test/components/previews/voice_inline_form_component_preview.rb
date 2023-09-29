# frozen_string_literal: true

class VoiceInlineFormComponentPreview < ViewComponent::Preview
  def default
    voice = Voice.first
    object_name = :voice
    view = ActionView::Base.empty
    form = ActionView::Helpers::FormBuilder.new(object_name, voice, view, {})
    render VoiceInlineFormComponent.new(form:, voice:)
  end
end
