# frozen_string_literal: true

class VoiceInlineFormComponent < ViewComponent::Base
  def initialize(form:, voice:)
    @form = form
    @voice = voice
  end

end
