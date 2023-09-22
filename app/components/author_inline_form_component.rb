# frozen_string_literal: true

class AuthorInlineFormComponent < ViewComponent::Base
  def initialize(author:, form:)
    @author = author
    @form = form
  end

end
