# frozen_string_literal: true

class AuthorInlineFormComponent < ViewComponent::Base
  include AuthorsHelper
  include DatesHelper

  with_collection_parameter :author

  def initialize(author:, form:)
    @author = author
    @form = form
  end
end
