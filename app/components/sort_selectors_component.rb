# frozen_string_literal: true

class SortSelectorsComponent < ViewComponent::Base
  def initialize(model:)
    @model = model
  end

  def options_for_sort_select
    model.options_for_sort_select
  end
end
